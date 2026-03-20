# frozen_string_literal: true

class Code
  class Parser
    class LabelName < Name
      def root
        (
          (special_name << separator.ignore) |
            (special_characters.absent << character.repeat(1))
        )
      end
    end
  end
end
