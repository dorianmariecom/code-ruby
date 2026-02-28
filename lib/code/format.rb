# frozen_string_literal: true

class Code
  class Format
    INDENT = "  "
    MAX_LINE_LENGTH = 80
    MIN_WIDTH = 20
    MAX_INLINE_STRING_LENGTH = 50
    MAX_INLINE_COLLECTION_LENGTH = 40
    MAX_INLINE_COLLECTION_ITEMS = 3
    MAX_INLINE_CALL_ARGUMENTS_LENGTH = 80
    MAX_INLINE_BLOCK_BODY_LENGTH = 40
    CONTINUATION_PADDING = 4

    class << self
      def format(parsed)
        new(parsed).format
      end
    end

    def initialize(parsed)
      @parsed = parsed || []
    end

    def format
      enforce_line_width(format_code(@parsed, indent: 0))
    end

    private

    def format_code(code, indent:, inline: false)
      statements = Array(code)
      return "" if statements.empty?

      separator = statement_separator(inline: inline, indent: indent)

      statements
        .map do |statement|
          formatted = format_statement(statement, indent: indent)
          pre_indented_statement?(statement) ? formatted : "#{INDENT * indent}#{formatted}"
        end
        .join(separator)
    end

    def format_code_inline(code, indent:)
      statements = Array(code)
      return "nothing" if statements.empty?
      return format_statement(statements.first, indent: indent) if statements.one?

      body = format_code(statements, indent: indent + 1)
      "begin\n#{body}\n#{INDENT * indent}end"
    end

    def format_statement(statement, indent:)
      if statement.is_a?(Hash) && statement.key?(:nothing)
        statement[:nothing].presence || "nothing"
      elsif statement.is_a?(Hash) && statement.key?(:boolean)
        statement[:boolean]
      elsif statement.is_a?(Hash) && statement.key?(:group)
        "(#{format_code_inline(statement[:group], indent: indent)})"
      elsif statement.is_a?(Hash) && statement.key?(:call)
        format_call(statement[:call], indent: indent)
      elsif statement.is_a?(Hash) && statement.key?(:number)
        format_number(statement[:number], indent: indent)
      elsif statement.is_a?(Hash) && statement.key?(:string)
        format_string(statement[:string], indent: indent)
      elsif statement.is_a?(Hash) && statement.key?(:list)
        format_list(statement[:list], indent: indent)
      elsif statement.is_a?(Hash) && statement.key?(:dictionnary)
        format_dictionary(statement[:dictionnary], indent: indent)
      elsif statement.is_a?(Hash) && statement.key?(:left_operation)
        format_left_operation(statement[:left_operation], indent: indent)
      elsif statement.is_a?(Hash) && statement.key?(:right_operation)
        format_right_operation(statement[:right_operation], indent: indent)
      elsif statement.is_a?(Hash) && statement.key?(:function)
        format_function(statement[:function], indent: indent)
      elsif statement.is_a?(Hash) && statement.key?(:negation)
        format_prefixed(statement[:negation], indent: indent)
      elsif statement.is_a?(Hash) && statement.key?(:unary_minus)
        format_prefixed(statement[:unary_minus], indent: indent)
      elsif statement.is_a?(Hash) && statement.key?(:ternary)
        format_ternary(statement[:ternary], indent: indent)
      elsif statement.is_a?(Hash) && statement.key?(:not)
        format_not(statement[:not], indent: indent)
      elsif statement.is_a?(Hash) && statement.key?(:if)
        format_if(statement[:if], indent: indent)
      elsif statement.is_a?(Hash) && statement.key?(:while)
        format_while(statement[:while], indent: indent)
      elsif statement.is_a?(Hash) && statement.key?(:splat)
        format_splat(statement[:splat], indent: indent)
      elsif statement.is_a?(Hash) && statement.key?(:square_bracket)
        format_square_bracket(statement[:square_bracket], indent: indent)
      else
        "nothing"
      end
    end

    def format_number(number, indent:)
      return "0" unless number.is_a?(Hash)

      if number.key?(:decimal)
        format_decimal(number[:decimal], indent: indent)
      elsif number.key?(:base_16)
        "0x#{number[:base_16]}"
      elsif number.key?(:base_8)
        "0o#{number[:base_8]}"
      elsif number.key?(:base_2)
        "0b#{number[:base_2]}"
      elsif number.key?(:base_10)
        format_base_10(number[:base_10], indent: indent)
      else
        "0"
      end
    end

    def format_base_10(base_10, indent:)
      return "0" unless base_10.is_a?(Hash)

      whole = format_grouped_whole(base_10[:whole] || "0")
      exponent = base_10[:exponent]
      return whole unless exponent

      "#{whole}e#{format_nested_statement(exponent, indent: indent)}"
    end

    def format_decimal(decimal, indent:)
      return "0.0" unless decimal.is_a?(Hash)

      raw = format_grouped_decimal(decimal[:decimal] || "0.0")
      exponent = decimal[:exponent]
      return raw unless exponent

      "#{raw}e#{format_nested_statement(exponent, indent: indent)}"
    end

    def format_grouped_whole(whole)
      value = whole.to_s
      return value unless value.match?(/\A\d+\z/)
      return value if value.start_with?("0") && value.length > 1

      value.reverse.scan(/.{1,3}/).join("_").reverse
    end

    def format_grouped_decimal(raw)
      value = raw.to_s
      whole, fraction = value.split(".", 2)
      return value unless whole && fraction

      "#{format_grouped_whole(whole)}.#{fraction.scan(/.{1,3}/).join("_")}"
    end

    def format_string(parts, indent:)
      return '""' if parts == "" || parts.nil?
      symbol = symbolizable_string(parts)
      return symbol if symbol

      # Always use double-quoted strings for a single canonical output.
      components =
        Array(parts).map do |part|
          if part.is_a?(Hash) && part.key?(:text)
            { type: :text, value: escape_string_text(part[:text].to_s) }
          elsif part.is_a?(Hash) && part.key?(:code)
            { type: :code, value: "{#{format_code_inline(part[:code], indent: indent)}}" }
          else
            { type: :text, value: escape_string_text(part.to_s) }
          end
        end
      content = components.map { |component| component[:value] }.join

      format_string_literal(
        content,
        components: components,
        indent: indent,
        allow_split: true
      )
    end

    def symbolizable_string(parts)
      nodes = Array(parts)
      return nil unless nodes.one?

      node = nodes.first
      return nil unless node.is_a?(Hash) && node.key?(:text)

      text = node[:text].to_s
      return nil unless text.match?(/\A[a-z_][a-z0-9_]*\z/)

      ":#{text}"
    end

    def escape_string_text(text)
      text
        .gsub("\\", "\\\\")
        .gsub('"', '\"')
        .gsub("{", "\\{")
    end

    def format_string_literal(content, components:, indent:, allow_split:)
      literal = %("#{content}")
      return literal if literal.length <= string_inline_limit(indent)
      return literal unless allow_split

      split_string_literal(components, indent: indent)
    end

    def split_string_literal(components, indent:)
      chunks = split_string_chunks(components, chunk_limit(indent))
      return %("#{chunks.first}") if chunks.one?

      continuation_indent = INDENT * (indent + 1)
      lines = chunks.map { |chunk| %("#{chunk}") }

      ([lines.first] +
        lines[1..].to_a.map { |line| "#{continuation_indent}+ #{line}" })
        .join("\n")
    end

    def split_string_chunks(components, limit)
      units =
        components.flat_map do |component|
          value = component[:value].to_s
          if component[:type] == :code
            [value]
          else
            value.split(/(\s+)/)
          end
        end.reject(&:empty?)

      chunks = [""]
      units.each do |unit|
        if unit.length > limit
          if chunks.last.empty?
            segments = unit.scan(/.{1,#{limit}}/m)
            chunks[-1] = segments.shift.to_s
            segments.each { |segment| chunks << segment }
          else
            chunks << unit
          end
          next
        end

        current = chunks.last
        candidate = "#{current}#{unit}"
        if !current.empty? && candidate.length > limit
          chunks[-1] = current
          chunks << unit
        else
          chunks[-1] = candidate
        end
      end

      chunks.reject(&:empty?)
    end

    def string_inline_limit(indent)
      [MIN_WIDTH, [MAX_INLINE_STRING_LENGTH, MAX_LINE_LENGTH - (INDENT * indent).length].min].max
    end

    def chunk_limit(indent)
      [MIN_WIDTH,
       [MAX_INLINE_STRING_LENGTH,
        MAX_LINE_LENGTH - (INDENT * (indent + 1)).length - CONTINUATION_PADDING].min].max
    end

    def format_list(elements, indent:)
      return "[]" if elements == "" || elements.nil?

      values =
        Array(elements).map { |element| format_code_inline(element, indent: 0) }
      return "[#{values.join(', ')}]" unless multiline_collection?(values)

      body = values.map { |value| indent_lines(value, indent + 1) }.join(",\n")
      "[\n#{body}\n#{INDENT * indent}]"
    end

    def format_dictionary(key_values, indent:)
      return "{}" if key_values == "" || key_values.nil?

      values =
        Array(key_values).map do |key_value|
          if key_value.is_a?(Hash) && key_value.key?(:name_code)
            format_dictionary_name_code(key_value[:name_code])
          elsif key_value.is_a?(Hash) && key_value.key?(:statement_code)
            format_dictionary_statement_code(key_value[:statement_code])
          elsif key_value.is_a?(Hash) && key_value.key?(:code)
            format_code_inline(key_value[:code], indent: 0)
          else
            format_code_inline([key_value], indent: 0)
          end
        end

      return "{ #{values.join(', ')} }" unless multiline_collection?(values)

      body = values.map { |value| indent_lines(value, indent + 1) }.join(",\n")
      "{\n#{body}\n#{INDENT * indent}}"
    end

    def format_dictionary_name_code(name_code)
      name = name_code[:name]
      return "#{name}:" unless name_code.key?(:code)

      value = format_code_inline(name_code[:code], indent: 0)
      "#{name}: #{value}"
    end

    def format_dictionary_statement_code(statement_code)
      key = format_nested_statement(statement_code[:statement], indent: 0)
      return key unless statement_code.key?(:code)

      value = format_code_inline(statement_code[:code], indent: 0)
      "#{key}: #{value}"
    end

    def format_call(call, indent:)
      name = call[:name]
      raw_arguments = Array(call[:arguments])
      arguments = raw_arguments.map { |arg| format_call_argument(arg) }
      statement =
        if arguments.empty?
          name.to_s
        elsif multiline_call_arguments?(raw_arguments, arguments)
          body = arguments.map { |arg| indent_lines(arg, indent + 1) }.join(",\n")
          "#{name}(\n#{body}\n#{INDENT * indent})"
        else
          "#{name}(#{arguments.join(', ')})"
        end

      return statement unless call.key?(:block)

      "#{statement} #{format_block(call[:block], indent: indent)}"
    end

    def format_call_argument(argument)
      value = format_code_inline(argument[:value], indent: 0)
      return value unless argument.key?(:name)

      "#{argument[:name]}: #{value}"
    end

    def format_block(block, indent:)
      parameters = Array(block[:parameters]).map { |parameter| format_parameter(parameter, indent: indent) }
      inline_body = format_inline_block_body(block[:body], indent: indent)
      if inline_body
        prefix = parameters.empty? ? "" : " |#{parameters.join(', ')}|"
        return "{#{prefix} #{inline_body} }"
      end

      header = parameters.empty? ? "{" : "{ |#{parameters.join(', ')}|"
      body = format_code(Array(block[:body]), indent: indent + 1)
      "#{header}\n#{body}\n#{INDENT * indent}}"
    end

    def format_function(function, indent:)
      parameters = Array(function[:parameters]).map { |parameter| format_parameter(parameter, indent: indent) }
      body = format_code(Array(function[:body]), indent: indent + 1)
      "(#{parameters.join(', ')}) => {\n#{body}\n#{INDENT * indent}}"
    end

    def format_parameter(parameter, indent:)
      return "" unless parameter.is_a?(Hash)

      prefix =
        if parameter.key?(:keyword_splat)
          parameter[:keyword_splat]
        elsif parameter.key?(:regular_splat)
          parameter[:regular_splat]
        elsif parameter.key?(:spread)
          parameter[:spread]
        elsif parameter.key?(:block)
          parameter[:block]
        else
          ""
        end

      name = parameter[:name].to_s
      left = "#{prefix}#{name}"

      if parameter.key?(:keyword)
        default = parameter[:default]
        return "#{name}:" unless default

        return "#{name}: #{format_code_inline(default, indent: indent)}"
      end

      default = parameter[:default]
      return left unless default

      "#{left} = #{format_code_inline(default, indent: indent)}"
    end

    def format_left_operation(operation, indent:)
      expression = format_nested_statement(operation[:first], indent: indent)

      Array(operation[:others]).each do |other|
        right = format_nested_statement(other[:statement], indent: indent)
        operator = other[:operator]

        expression =
          if compact_operator?(operator)
            "#{expression}#{operator}#{right}"
          else
            candidate = "#{expression} #{operator} #{right}"
            if expression.include?("\n") || candidate.length > MAX_LINE_LENGTH
              right_parts = right.split(" #{operator} ")
              continuation_lines =
                right_parts.map do |part|
                  "#{INDENT * (indent + 1)}#{operator} #{part}"
                end
              "#{expression}\n#{continuation_lines.join("\n")}"
            else
              candidate
            end
          end
      end

      expression
    end

    def format_right_operation(operation, indent:)
      operator = operation[:operator].to_s
      left = format_nested_statement(operation[:left], indent: indent)
      right = format_nested_statement(operation[:right], indent: indent)
      "#{left} #{operator} #{right}"
    end

    def compact_operator?(operator)
      [".", "::", "&.", "..", "..."].include?(operator)
    end

    def format_ternary(ternary, indent:)
      left = format_nested_statement(ternary[:left], indent: indent)
      middle = format_nested_statement(ternary[:middle], indent: indent)
      return "#{left} ? #{middle}" unless ternary.key?(:right)

      right = format_nested_statement(ternary[:right], indent: indent)
      "#{left} ? #{middle} : #{right}"
    end

    def format_not(not_statement, indent:)
      right = format_nested_statement(not_statement[:right], indent: indent)
      "#{not_statement[:operator]} #{right}"
    end

    def format_prefixed(statement, indent:)
      right = format_nested_statement(statement[:right], indent: indent)
      "#{statement[:operator]}#{right}"
    end

    def format_splat(statement, indent:)
      right = format_nested_statement(statement[:right], indent: indent)
      "#{statement[:operator]}#{right}"
    end

    def format_square_bracket(square_bracket, indent:)
      left = format_nested_statement(square_bracket[:left], indent: indent)
      suffix =
        Array(square_bracket[:statements]).map do |statement|
          "[#{format_nested_statement(statement, indent: indent)}]"
        end.join
      "#{left}#{suffix}"
    end

    def format_if(if_statement, indent:)
      lines = []
      first_operator = if_statement[:first_operator]
      first_statement =
        format_nested_statement(if_statement[:first_statement], indent: indent)
      lines << "#{INDENT * indent}#{first_operator} #{first_statement}"
      lines << format_code(if_statement[:first_body], indent: indent + 1)

      Array(if_statement[:elses]).each do |branch|
        lines.concat(format_if_branch(branch, indent: indent))
      end

      lines << "#{INDENT * indent}end"
      lines.join("\n")
    end

    def format_if_branch(branch, indent:)
      operator = branch[:operator]

      case operator
      when "elsif", "elsunless"
        statement = format_nested_statement(branch[:statement], indent: indent)
        [
          "#{INDENT * indent}#{operator} #{statement}",
          format_code(branch[:body], indent: indent + 1)
        ]
      when "if", "unless"
        statement = format_nested_statement(branch[:statement], indent: indent)
        [
          "#{INDENT * indent}else #{operator} #{statement}",
          format_code(branch[:body], indent: indent + 1)
        ]
      else
        ["#{INDENT * indent}else", format_code(branch[:body], indent: indent + 1)]
      end
    end

    def format_while(while_statement, indent:)
      operator = while_statement[:operator]

      if operator == "loop"
        body = format_code(while_statement[:body], indent: indent + 1)
        return "#{INDENT * indent}loop {\n#{body}\n#{INDENT * indent}}"
      end

      statement = format_nested_statement(while_statement[:statement], indent: indent)
      body = format_code(while_statement[:body], indent: indent + 1)
      "#{INDENT * indent}#{operator} #{statement}\n#{body}\n#{INDENT * indent}end"
    end

    def format_nested_statement(statement, indent:)
      format_statement(statement, indent: indent)
    end

    def multiline_collection?(values)
      return true if values.any? { |value| value.include?("\n") }
      return true if values.size > MAX_INLINE_COLLECTION_ITEMS

      values.join(", ").length > MAX_INLINE_COLLECTION_LENGTH
    end

    def multiline_call_arguments?(raw_arguments, arguments)
      return true if arguments.any? { |argument| argument.include?("\n") }
      return true if arguments.size > MAX_INLINE_COLLECTION_ITEMS
      return true if arguments.join(", ").length > MAX_INLINE_CALL_ARGUMENTS_LENGTH

      raw_arguments.any? do |argument|
        named_value = argument[:value]
        next false unless named_value.is_a?(Array)

        named_value.any? do |statement|
          statement.is_a?(Hash) &&
            (statement.key?(:dictionnary) || statement.key?(:list))
        end
      end
    end

    def indent_lines(value, indent)
      prefix = INDENT * indent
      value.split("\n").map { |line| "#{prefix}#{line}" }.join("\n")
    end

    def statement_separator(inline:, indent: _indent)
      return " " if inline
      "\n\n"
    end

    def pre_indented_statement?(statement)
      statement.is_a?(Hash) && (statement.key?(:if) || statement.key?(:while))
    end

    def format_inline_block_body(body, indent:)
      statements = Array(body)
      return nil unless statements.one?

      formatted = format_code_inline(statements, indent: indent)
      return nil if formatted.include?("\n")
      return nil if formatted.length > MAX_INLINE_BLOCK_BODY_LENGTH

      formatted
    end

    def enforce_line_width(formatted)
      formatted
        .split("\n")
        .flat_map { |line| wrap_line(line) }
        .join("\n")
    end

    def wrap_line(line)
      return [line] if line.length <= MAX_LINE_LENGTH

      indent = line[/\A */].to_s
      split =
        find_split(line, " and ") ||
        find_split(line, " or ") ||
        find_split(line, " ? ") ||
        find_split(line, " : ") ||
        find_split(line, " <=> ") ||
        find_split(line, " >= ") ||
        find_split(line, " <= ") ||
        find_split(line, " == ") ||
        find_split(line, " = ") ||
        find_split(line, ".")

      return [line] unless split

      index, token = split
      left = line[0...index]
      right = line[(index + token.length)..]
      continuation = "#{indent}#{INDENT}#{right.lstrip}"

      first_line =
        if token == "."
          left
        else
          "#{left}#{token.rstrip}"
        end
      second_line =
        if token == "."
          "#{indent}#{INDENT}.#{right}"
        else
          continuation
        end

      [first_line, *wrap_line(second_line)]
    end

    def find_split(line, token)
      return nil unless line.length > MAX_LINE_LENGTH

      search_limit = [MAX_LINE_LENGTH, line.length - token.length].min
      index = line.rindex(token, search_limit)
      while index
        break if index.positive? && outside_string?(line, index)

        index = line.rindex(token, index - 1)
      end
      return nil unless index

      [index, token]
    end

    def outside_string?(line, index)
      quote_count = 0
      escaped = false
      line[0...index].each_char do |char|
        if escaped
          escaped = false
          next
        end

        if char == "\\"
          escaped = true
        elsif char == '"'
          quote_count += 1
        end
      end

      quote_count.even?
    end

  end
end
