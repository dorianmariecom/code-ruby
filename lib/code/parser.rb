# frozen_string_literal: true

class Code
  class Parser
    class Error < ::Code::Error
    end

    class Language
    end

    Token = Data.define(:type, :value, :position, :newline_before, :space_before)

    KEYWORDS = %w[
      and
      begin
      do
      else
      elsif
      elsunless
      end
      false
      if
      loop
      not
      nothing
      or
      rescue
      true
      unless
      until
      while
    ].freeze

    MULTI_CHAR_OPERATORS = %w[
      &.
      &&
      &&=
      **
      *=
      +=
      -=
      ..
      ...
      /=
      ::
      <<=
      <<
      <=>
      <=
      ===
      ==
      =~
      >=
      >>=
      >>
      ||=
      ||
      |=
      !==
      !=
      !~
      %=
      ^=
      =>
    ].sort_by(&:length).reverse.freeze

    ASSIGNMENT_RHS_MIN_BP = 20

    INFIX_PRECEDENCE = {
      "if" => [10, 9],
      "unless" => [10, 9],
      "while" => [10, 9],
      "until" => [10, 9],
      "or" => [20, 21],
      "=" => [30, 29],
      "+=" => [30, 29],
      "-=" => [30, 29],
      "*=" => [30, 29],
      "/=" => [30, 29],
      "%=" => [30, 29],
      "<<=" => [30, 29],
      ">>=" => [30, 29],
      "&=" => [30, 29],
      "|=" => [30, 29],
      "^=" => [30, 29],
      "||=" => [30, 29],
      "&&=" => [30, 29],
      "rescue" => [35, 34],
      "?" => [40, 39],
      ".." => [50, 51],
      "..." => [50, 51],
      "||" => [60, 61],
      "and" => [70, 71],
      "&&" => [70, 71],
      "==" => [80, 81],
      "===" => [80, 81],
      "!=" => [80, 81],
      "!==" => [80, 81],
      "<=>" => [80, 81],
      "=~" => [80, 81],
      "~=" => [80, 81],
      "!~" => [80, 81],
      ">=" => [90, 91],
      "<=" => [90, 91],
      ">" => [90, 91],
      "<" => [90, 91],
      "|" => [100, 101],
      "^" => [105, 106],
      "&" => [110, 111],
      "<<" => [120, 121],
      ">>" => [120, 121],
      "+" => [130, 131],
      "-" => [130, 131],
      "*" => [140, 141],
      "/" => [140, 141],
      "%" => [140, 141],
      "×" => [140, 141],
      "÷" => [140, 141],
      "**" => [160, 159]
    }.freeze

    def initialize(input)
      @input = input.to_s
      @tokens = lex(@input)
      @index = 0
    end

    def self.parse(...)
      new(...).parse
    end

    def parse
      Node::Code.new(parse_code)
    end

    private

    attr_reader :input, :tokens

    def parse_code(stop_keywords: [], stop_values: [])
      statements = []
      skip_newlines

      until eof?
        break if stop?(stop_keywords, stop_values)

        statements << parse_expression
        consume_newlines
      end

      statements
    end

    def parse_expression(min_bp = 0)
      token = advance
      left = nud(token)

      loop do
        token = current
        break if token.type == :eof
        if token.type == :newline
          next_token = next_significant_token
          break unless continuation_after_newline?(next_token)

          skip_newlines
          next
        end

        if postfix_start?(token)
          break if token.newline_before && !newline_postfix_continuation?(token)
          break if token.value == "[" && token.space_before
          break if call_like_postfix?(token) && !callable_expression?(left)

          left = led_postfix(left)
          next
        end

        operator = infix_operator(token)
        break unless operator

        left_bp, right_bp = INFIX_PRECEDENCE.fetch(operator)
        break if left_bp < min_bp

        advance
        left = led_infix(left, operator, right_bp)
      end

      left
    end

    def nud(token)
      case token.type
      when :identifier
        { call: { name: token.value } }
      when :number
        token.value
      when :symbol
        { string: [{ text: token.value }] }
      when :string
        { string: token.value.map { |part| string_part_to_raw(part) } }
      when :keyword
        nud_keyword(token)
      when :operator
        nud_operator(token)
      when :punctuation
        nud_punctuation(token)
      else
        raise_parse_error("unexpected token #{token.value.inspect}", token)
      end
    end

    def nud_keyword(token)
      case token.value
      when "true", "false"
        { boolean: token.value }
      when "nothing"
        { nothing: token.value }
      when "if", "unless"
        parse_if_expression(token.value)
      when "while", "until", "loop"
        parse_while_expression(token.value)
      when "begin"
        body = parse_code(stop_keywords: ["end"])
        advance if match?(:keyword, "end")
        { group: body }
      when "not"
        { not: { operator: token.value, right: parse_expression(25) } }
      else
        { call: { name: token.value } }
      end
    end

    def nud_operator(token)
      case token.value
      when "&"
        { splat: { operator: token.value, right: parse_expression(5) } }
      when "!", "~", "+"
        wrap_prefixed_expression(:negation, token.value, parse_expression(145))
      when "-"
        wrap_prefixed_expression(:unary_minus, token.value, parse_expression(159))
      else
        raise_parse_error("unexpected operator #{token.value.inspect}", token)
      end
    end

    def nud_punctuation(token)
      case token.value
      when "("
        parse_group_or_function
      when "["
        parse_list
      when "{"
        parse_dictionary
      when ":"
        parse_symbol_literal
      else
        raise_parse_error("unexpected punctuation #{token.value.inspect}", token)
      end
    end

    def led_postfix(left)
      case current.value
      when ".", "::", "&."
        operator = advance.value
        statement = parse_expression(151)
        append_left_operation(left, operator, statement)
      when "["
        advance
        statements = []
        skip_newlines
        unless match?(:punctuation, "]")
          loop do
            statements << parse_expression
            skip_newlines
            break unless match?(:punctuation, ",")

            advance
            skip_newlines
          end
        end
        expect(:punctuation, "]")
        { square_bracket: { left: left, statements: statements } }
      when "("
        arguments = parse_call_arguments
        attach_call_arguments(left, arguments)
      when "{"
        attach_call_block(left, parse_block("{"))
      else
        attach_call_block(left, parse_block("do"))
      end
    end

    def led_infix(left, operator, right_bp)
      case operator
      when "=", "+=", "-=", "*=", "/=", "%=", "<<=", ">>=", "&=", "|=",
           "^=", "||=", "&&="
        skip_newlines
        {
          right_operation: {
            left: left,
            operator: operator,
            right: parse_expression(ASSIGNMENT_RHS_MIN_BP)
          }
        }
      when "if", "unless", "while", "until", "rescue"
        skip_newlines
        { right_operation: { left: left, operator: operator, right: parse_expression(right_bp) } }
      when "?"
        skip_newlines
        middle = parse_expression
        right =
          if match?(:punctuation, ":")
            advance
            skip_newlines
            parse_expression(right_bp)
          end
        { ternary: { left: left, middle: middle, right: right } }
      else
        skip_newlines
        right = parse_expression(right_bp)

        if operator == "**"
          { right_operation: { left: left, operator: operator, right: right } }
        else
          append_left_operation(left, operator, right)
        end
      end
    end

    def parse_if_expression(operator)
      skip_newlines
      statement = parse_expression
      body = parse_body(%w[elsif elsunless else end])
      elses = []

      loop do
        skip_newlines

        if match?(:keyword, "elsif") || match?(:keyword, "elsunless")
          else_operator = advance.value
          skip_newlines
          else_statement = parse_expression
          else_body = parse_body(%w[elsif elsunless else end])
          elses << { operator: else_operator, statement: else_statement, body: else_body }
          next
        end

        if match?(:keyword, "else")
          advance
          skip_newlines

          if match?(:keyword, "if") || match?(:keyword, "unless")
            elses << {
              operator: "else",
              body: [parse_if_expression(advance.value)]
            }
          else
            elses << { operator: "else", body: parse_body(%w[end]) }
          end

          break
        end

        break
      end

      skip_newlines
      advance if match?(:keyword, "end")

      {
        if: {
          first_operator: operator,
          first_statement: statement,
          first_body: body,
          elses: elses
        }
      }
    end

    def parse_while_expression(operator)
      skip_newlines

      statement = parse_expression unless operator == "loop"
      body = parse_body(%w[end])
      skip_newlines
      advance if match?(:keyword, "end")

      {
        while: {
          operator: operator,
          statement: statement,
          body: body
        }.compact
      }
    end

    def parse_group_or_function
      checkpoint = @index
      parameters = try_parse_parameters(")")

      if parameters && match?(:operator, "=>")
        advance
        body = parse_lambda_body
        return { function: { parameters: parameters, body: body } }
      end

      @index = checkpoint
      code = parse_code(stop_values: [")"])
      expect(:punctuation, ")")
      { group: code }
    end

    def parse_lambda_body
      if match?(:punctuation, "{")
        parse_delimited_code("{", "}")
      elsif match?(:keyword, "do") || match?(:keyword, "begin")
        advance
        parse_code(stop_keywords: ["end"]).tap do
          skip_newlines
          advance if match?(:keyword, "end")
        end
      else
        [parse_expression]
      end
    end

    def parse_list
      elements = []
      skip_newlines

      unless match?(:punctuation, "]")
        loop do
          elements << parse_code(stop_values: [",", "]"])
          break unless match?(:punctuation, ",")

          advance
          skip_newlines
          break if match?(:punctuation, "]")
        end
      end

      expect(:punctuation, "]")
      { list: elements }
    end

    def parse_dictionary
      key_values = []
      skip_newlines

      unless match?(:punctuation, "}")
        loop do
          key_values << parse_dictionary_entry
          skip_newlines
          break unless match?(:punctuation, ",")

          advance
          skip_newlines
          break if match?(:punctuation, "}")
        end
      end

      advance if match?(:punctuation, "}")
      { dictionnary: key_values }
    end

    def parse_dictionary_entry
      if label_name_start?(current) && next_token_value == ":"
        name = advance.value
        advance
        code = parse_optional_code([",", "}"])
        return { name_code: { name: name, code: code }.compact }
      end

      statement = parse_expression

      if match?(:punctuation, ":")
        advance
        code = parse_optional_code([",", "}"])
        { statement_code: { statement: statement, code: code }.compact }
      elsif match?(:operator, "=>")
        advance
        code = parse_optional_code([",", "}"])
        { statement_code: { statement: statement, code: code }.compact }
      else
        { code: wrap_code(statement) }
      end
    end

    def parse_symbol_literal
      token = current
      unless label_name_start?(token)
        raise_parse_error("expected symbol name", token)
      end

      { string: [{ text: advance.value }] }
    end

    def parse_body(stop_keywords)
      if match?(:keyword, "do") || match?(:keyword, "begin")
        advance
        parse_code(stop_keywords: ["end"])
      elsif match?(:punctuation, "{")
        parse_delimited_code("{", "}")
      else
        parse_code(stop_keywords: stop_keywords)
      end
    end

    def parse_delimited_code(opening, closing)
      expect(:punctuation, opening)
      parse_code(stop_values: [closing]).tap { expect(:punctuation, closing) }
    end

    def parse_call_arguments
      expect(:punctuation, "(")
      arguments = []
      skip_newlines

      unless match?(:punctuation, ")")
        loop do
          arguments << parse_argument
          skip_newlines
          break unless match?(:punctuation, ",")

          advance
          skip_newlines
          break if match?(:punctuation, ")")
        end
      end

      expect(:punctuation, ")")
      arguments
    end

    def parse_argument
      if label_name_start?(current) && next_token_value == ":"
        name = advance.value
        advance
        { name: name, value: parse_code(stop_values: [",", ")"]) }
      else
        { value: parse_code(stop_values: [",", ")"]) }
      end
    end

    def parse_block(kind)
      if kind == "{"
        expect(:punctuation, "{")
        parameters = parse_pipe_parameters
        body = parse_code(stop_values: ["}"])
        expect(:punctuation, "}")
      else
        expect(:keyword, "do")
        parameters = parse_pipe_parameters
        body = parse_code(stop_keywords: ["end"])
        skip_newlines
        expect(:keyword, "end")
      end

      { parameters: parameters || [], body: body }
    end

    def parse_pipe_parameters
      return unless match?(:operator, "|")

      advance
      parameters = []
      skip_newlines

      until match?(:operator, "|")
        parameters << parse_parameter
        skip_newlines
        break unless match?(:punctuation, ",")

        advance
        skip_newlines
      end

      expect(:operator, "|")
      parameters
    end

    def try_parse_parameters(closing)
      parameters = []
      skip_newlines

      until match?(:punctuation, closing)
        return nil if eof?

        parameters << parse_parameter
        skip_newlines

        break unless match?(:punctuation, ",")

        advance
        skip_newlines
      end

      expect(:punctuation, closing)
      parameters
    rescue Error
      nil
    end

    def parse_parameter
      prefix = parse_parameter_prefix

      if label_name_start?(current) && next_token_value == ":"
        name = advance.value
        advance
        default = parse_optional_code([",", ")", "|"])
        return { name: name, keyword: ":", default: default }.compact
      end

      name = advance.value if current.type == :identifier || keyword_name?(current)
      default =
        if match?(:operator, "=")
          advance
          parse_code(stop_values: [",", ")", "|"])
        end

      {
        name: name,
        regular_splat: (true if prefix == "*"),
        keyword_splat: (true if prefix == "**"),
        block: (true if prefix == "&"),
        spread: (true if %w[. .. ...].include?(prefix)),
        default: default
      }.compact
    end

    def parse_parameter_prefix
      return unless current.type == :operator

      return advance.value if %w[* ** & .. ... .].include?(current.value)
    end

    def parse_optional_code(stop_values)
      skip_newlines
      return if stop_values.include?(current.value)

      parse_code(stop_values: stop_values)
    end

    def attach_call_arguments(left, arguments)
      update_terminal_call(left) do |call|
        call[:arguments] = arguments
      end
    end

    def attach_call_block(left, block)
      update_terminal_call(left) do |call|
        call[:block] = block
      end
    end

    def update_terminal_call(left)
      if left.key?(:call)
        call = left[:call].deep_dup
        yield(call)
        { call: call }
      elsif left.key?(:left_operation)
        raw = left.deep_dup
        target = raw[:left_operation][:others].last

        if target
          call = target[:statement].fetch(:call).deep_dup
          yield(call)
          target[:statement] = { call: call }
        else
          call = raw[:left_operation][:first].fetch(:call).deep_dup
          yield(call)
          raw[:left_operation][:first] = { call: call }
        end

        raw
      else
        raise Error, "call arguments require a callable expression"
      end
    end

    def append_left_operation(left, operator, statement)
      if left.key?(:left_operation) &&
           same_left_operation_group?(left[:left_operation], operator)
        raw = left.deep_dup
        target = raw[:left_operation][:others].last
        target[:statement] = append_left_operation(target[:statement], operator, statement)
        raw
      else
        {
          left_operation: {
            first: left,
            others: [{ operator: operator, statement: statement }]
          }
        }
      end
    end

    def same_left_operation_group?(left_operation, operator)
      others = left_operation[:others] || []
      return false if others.empty?

      operator_group(others.last[:operator]) == operator_group(operator)
    end

    def operator_group(operator)
      case operator
      when ".", "::", "&." then :chain
      when "or", "and" then :keyword_logic
      when "||" then :or_operator
      when "&&" then :and_operator
      when "==", "===", "!=", "!==", "<=>", "=~", "~=", "!~" then :equality
      when ">", "<", ">=", "<=" then :comparison
      when "|", "^" then :bitwise_or
      when "&" then :bitwise_and
      when "<<", ">>" then :shift
      when "+", "-" then :addition
      when "*", "/", "%", "×", "÷" then :multiplication
      when "..", "..." then :range
      else
        operator
      end
    end

    def wrap_prefixed_expression(type, operator, right)
      node = { type => { operator: operator, right: right } }
      return node unless right.is_a?(Hash) && right.key?(:left_operation)

      left_operation = right[:left_operation].deep_dup
      {
        left_operation: {
          first: { type => { operator: operator, right: left_operation[:first] } },
          others: left_operation[:others]
        }
      }
    end

    def wrap_code(statement)
      statement.is_a?(Array) ? statement : [statement]
    end

    def string_part_to_raw(part)
      if part[:type] == :text
        { text: part[:value] }
      else
        { code: self.class.parse(part[:value]).to_raw }
      end
    end

    def stop?(stop_keywords, stop_values)
      (current.type == :keyword && stop_keywords.include?(current.value)) ||
        stop_values.include?(current.value)
    end

    def postfix_start?(token)
      token.type == :punctuation && ["(", "[", "{"].include?(token.value) ||
        token.type == :operator && [".", "::", "&."].include?(token.value) ||
        token.type == :keyword && token.value == "do"
    end

    def call_like_postfix?(token)
      token.type == :punctuation && ["(", "{"].include?(token.value) ||
        token.type == :keyword && token.value == "do"
    end

    def infix_operator(token)
      return token.value if token.type == :operator && INFIX_PRECEDENCE.key?(token.value)
      return token.value if token.type == :keyword && INFIX_PRECEDENCE.key?(token.value)
      return token.value if token.type == :punctuation && token.value == "?"
    end

    def label_name_start?(token)
      token.type == :identifier || token.type == :keyword
    end

    def keyword_name?(token)
      token.type == :keyword && !%w[if unless while until loop not rescue or and do begin else elsif elsunless end true false nothing].include?(token.value)
    end

    def callable_expression?(expression)
      return true if expression.key?(:call)
      return false unless expression.key?(:left_operation)

      tail = expression[:left_operation][:others]&.last
      target = tail ? tail[:statement] : expression[:left_operation][:first]
      target.is_a?(Hash) && target.key?(:call)
    end

    def current
      tokens.fetch(@index)
    end

    def next_token_value
      tokens.fetch(@index + 1, Token.new(type: :eof, value: nil, position: input.length, newline_before: false, space_before: false)).value
    end

    def advance
      token = current
      @index += 1
      token
    end

    def match?(type, value = nil)
      token = current
      token.type == type && (value.nil? || token.value == value)
    end

    def expect(type, value = nil)
      token = current
      return advance if token.type == type && (value.nil? || token.value == value)

      expected = value || type
      raise_parse_error("expected #{expected.inspect}", token)
    end

    def eof?
      current.type == :eof
    end

    def skip_newlines
      advance while current.type == :newline
    end

    def next_significant_token
      index = @index
      index += 1 while tokens[index]&.type == :newline
      tokens.fetch(index, Token.new(type: :eof, value: nil, position: input.length, newline_before: false, space_before: false))
    end

    def continuation_after_newline?(token)
      return false if token.type == :eof
      return true if token.type == :operator && INFIX_PRECEDENCE.key?(token.value)
      return true if token.type == :keyword && %w[or and rescue].include?(token.value)
      return true if token.type == :punctuation && token.value == "?"

      token.type == :operator && [".", "::", "&."].include?(token.value)
    end

    def newline_postfix_continuation?(token)
      token.type == :operator && [".", "::", "&."].include?(token.value)
    end

    def consume_newlines
      skip_newlines
    end

    def raise_parse_error(message, token = current)
      raise Error, "#{message} at #{token.position}"
    end

    def lex(source)
      tokens = []
      index = 0
      newline_before = false
      space_before = false

      while index < source.length
        char = source[index]

        if char == " " || char == "\t"
          index += 1
          space_before = true
          next
        end

        if char == "\n" || char == "\r"
          if char == "\r" && source[index + 1] == "\n"
            index += 2
          else
            index += 1
          end

          tokens << Token.new(type: :newline, value: "\n", position: index - 1, newline_before: false, space_before: false)
          newline_before = true
          space_before = false
          next
        end

        if char == "#"
          index += 1
          index += 1 while index < source.length && !["\n", "\r"].include?(source[index])
          space_before = true unless newline_before
          next
        end

        if source[index, 2] == "//"
          index += 2
          index += 1 while index < source.length && !["\n", "\r"].include?(source[index])
          space_before = true unless newline_before
          next
        end

        if source[index, 2] == "/*"
          index += 2
          while index < source.length && source[index, 2] != "*/"
            newline_before ||= ["\n", "\r"].include?(source[index])
            index += 1
          end
          index += 2 if source[index, 2] == "*/"
          space_before = true unless newline_before
          next
        end

        if (string_data = scan_string(source, index))
          tokens << Token.new(type: :string, value: string_data[:parts], position: index, newline_before: newline_before, space_before: space_before)
          index = string_data[:index]
          newline_before = false
          space_before = false
          next
        end

        if (symbol_data = scan_symbol(source, index))
          tokens << Token.new(type: :symbol, value: symbol_data[:value], position: index, newline_before: newline_before, space_before: space_before)
          index = symbol_data[:index]
          newline_before = false
          space_before = false
          next
        end

        if (number_data = scan_number(source, index))
          tokens << Token.new(type: :number, value: number_data[:raw], position: index, newline_before: newline_before, space_before: space_before)
          index = number_data[:index]
          newline_before = false
          space_before = false
          next
        end

        operator = MULTI_CHAR_OPERATORS.find { |candidate| source[index, candidate.length] == candidate }
        if operator
          type = operator == "=>" ? :operator : :operator
          tokens << Token.new(type: type, value: operator, position: index, newline_before: newline_before, space_before: space_before)
          index += operator.length
          newline_before = false
          space_before = false
          next
        end

        if %w[( ) [ ] { } , ? :].include?(char)
          tokens << Token.new(type: :punctuation, value: char, position: index, newline_before: newline_before, space_before: space_before)
          index += 1
          newline_before = false
          space_before = false
          next
        end

        if %w[. & | = ! ~ + - * / % < > ^ × ÷].include?(char)
          tokens << Token.new(type: :operator, value: char, position: index, newline_before: newline_before, space_before: space_before)
          index += 1
          newline_before = false
          space_before = false
          next
        end

        identifier = scan_identifier(source, index)
        if identifier
          type = KEYWORDS.include?(identifier) ? :keyword : :identifier
          tokens << Token.new(type: type, value: identifier, position: index, newline_before: newline_before, space_before: space_before)
          index += identifier.length
          newline_before = false
          space_before = false
          next
        end

        raise Error, "unexpected character #{char.inspect} at #{index}"
      end

      tokens << Token.new(type: :eof, value: nil, position: source.length, newline_before: newline_before, space_before: space_before)
      tokens
    end

    def scan_string(source, index)
      quote = source[index]
      return unless quote == "'" || quote == '"'

      parts = []
      text = +""
      i = index + 1

      while i < source.length
        char = source[i]

        if char == "\\"
          i += 1
          break if i >= source.length

          escaped = source[i]
          if escaped == quote || escaped == "{"
            text << escaped
          else
            text << "\\" << escaped
          end
          i += 1
          next
        end

        if char == quote
          parts << { type: :text, value: text } unless text.empty?
          return { parts: parts, index: i + 1 }
        end

        if char == "{"
          parts << { type: :text, value: text } unless text.empty?
          text = +""
          code, i = extract_braced(source, i)
          parts << { type: :code, value: code }
          next
        end

        text << char
        i += 1
      end

      parts << { type: :text, value: text } unless text.empty?
      { parts: parts, index: i }
    end

    def extract_braced(source, index)
      depth = 1
      i = index + 1
      body = +""

      while i < source.length
        char = source[i]

        if char == "{"
          depth += 1
          body << char
          i += 1
        elsif char == "}"
          depth -= 1
          return [body, i + 1] if depth.zero?

          body << char
          i += 1
        else
          body << char
          i += 1
        end
      end

      [body, i]
    end

    def scan_number(source, index)
      rest = source[index..]
      return unless rest

      if (match = /\A0[xX][0-9a-fA-F](?:_?[0-9a-fA-F])*/.match(rest))
        return { raw: { number: { base_16: match[0][2..].delete("_") } }, index: index + match[0].length }
      end

      if (match = /\A0[oO][0-7](?:_?[0-7])*/.match(rest))
        return { raw: { number: { base_8: match[0][2..].delete("_") } }, index: index + match[0].length }
      end

      if (match = /\A0[bB][01](?:_?[01])*/.match(rest))
        return { raw: { number: { base_2: match[0][2..].delete("_") } }, index: index + match[0].length }
      end

      if (match = /\A[0-9](?:_?[0-9])*\.[0-9](?:_?[0-9])*(?:[eE][0-9](?:_?[0-9])*(?:\.[0-9](?:_?[0-9])*)?)?/.match(rest))
        decimal, exponent = match[0].split(/[eE]/, 2)
        raw = { decimal: decimal.delete("_") }
        raw[:exponent] = exponent_to_raw(exponent) if exponent
        return { raw: { number: { decimal: raw } }, index: index + match[0].length }
      end

      if (match = /\A[0-9](?:_?[0-9])*(?:[eE][0-9](?:_?[0-9])*(?:\.[0-9](?:_?[0-9])*)?)?/.match(rest))
        whole, exponent = match[0].split(/[eE]/, 2)
        raw = { whole: whole.delete("_") }
        raw[:exponent] = exponent_to_raw(exponent) if exponent
        return { raw: { number: { base_10: raw } }, index: index + match[0].length }
      end
    end

    def exponent_to_raw(exponent)
      exponent = exponent.delete("_")
      return { number: { decimal: { decimal: exponent } } } if exponent.include?(".")

      { number: { base_10: { whole: exponent } } }
    end

    def scan_symbol(source, index)
      return unless source[index] == ":"
      return if source[index, 2] == "::"
      return unless symbol_start_context?(source, index)

      next_char = source[index + 1]
      return if next_char.nil? || next_char =~ /\s/
      return if %w[( ) [ ] { } ,].include?(next_char)

      value = +""
      i = index + 1

      while i < source.length
        char = source[i]
        break if char =~ /\s/
        break if "()[]{}.,:&|=~*/%<>^#".include?(char)

        if char == "!" || char == "?"
          value << char
          i += 1
          break
        end

        value << char
        i += 1
      end

      return if value.empty?

      { value: value, index: i }
    end

    def symbol_start_context?(source, index)
      return true if index.zero?

      previous = source[index - 1]
      previous =~ /\s/ || "([{,=:+-!*/%<>?&|^\n\r".include?(previous)
    end

    def scan_identifier(source, index)
      value = +""
      i = index

      while i < source.length
        char = source[i]
        break if char =~ /\s/

        if char == "!" || char == "?"
          if value.empty? || source[i + 1] == "=" || source[i + 1] == "~"
            break
          end

          value << char
          i += 1
          break
        end

        break if "()[]{}.,:&|=~+-*/%<>^#".include?(char)

        value << char
        i += 1
      end

      value unless value.empty?
    end
  end
end
