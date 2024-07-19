# frozen_string_literal: true

class Code
  class Node
    class String < Node
      class Part < Node
        class Code < Node
          def initialize(parsed)
            return if parsed.blank?

            @code = Node::Code.new(parsed.presence)
          end

          def evaluate(**args)
            @code&.evaluate(**args) || Object::Nothing.new
          end
        end

        class Text < Node
          def initialize(parsed)
            return if parsed.nil?

            @text = parsed
          end

          def evaluate(**_args)
            ::Code::Object::String.new(
              @text
                .to_s
                .gsub('\n', "\n")
                .gsub('\r', "\r")
                .gsub('\t', "\t")
                .gsub('\b', "\b")
                .gsub('\f', "\f")
                .gsub('\a', "\a")
                .gsub('\e', "\e")
            )
          end
        end

        def initialize(parsed)
          return if parsed.nil?

          if parsed.key?(:text)
            @part = Node::String::Part::Text.new(parsed.delete(:text))
          elsif parsed.key?(:code)
            @part = Node::String::Part::Code.new(parsed.delete(:code))
          end
        end

        def evaluate(**args)
          @part&.evaluate(**args) || Object::Nothing.new
        end
      end

      def initialize(parsed)
        return if parsed.blank?

        @parts =
          (parsed.presence || []).map { |part| Node::String::Part.new(part) }
      end

      def evaluate(**args)
        ::Code::Object::String.new(
          (@parts || []).map { |part| part.evaluate(**args) }.map(&:to_s).join
        )
      end
    end
  end
end
