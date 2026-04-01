# frozen_string_literal: true

class Code
  class Node
    class Code < Node
      def initialize(parsed)
        return if parsed.blank?

        @parsed = parsed.deep_dup
        @statements =
          (parsed.presence || []).map { |statement| Statement.new(statement) }
      end

      def evaluate(**args)
        global_control_flow_root = args.fetch(:global_control_flow_root, false)
        control_flow_scope = args.fetch(:control_flow_scope, nil)
        statement_args =
          if global_control_flow_root
            args.merge(global_control_flow_root: false)
          else
            args
          end
        last = Object::Nothing.new

        begin
          (@statements || []).each do |statement|
            last =
              statement.evaluate(**statement_args, object: Object::Global.new)
          end
        rescue Error::Retry
          retry if control_flow_scope == :group

          raise
        rescue Error::Break => e
          return e.code_value if control_flow_scope == :group

          raise
        end

        last
      rescue Error::ControlFlow => e
        raise unless global_control_flow_root

        retry if e.is_a?(Error::Retry)

        e.code_value
      end

      def resolve(**args)
        last = Object::Nothing.new

        (@statements || []).each do |statement|
          last = statement.resolve(**args, object: Object::Global.new)
        end

        last
      end

      def to_code
        @statements.blank? ? Object::Nothing.new : Object::Code.new(self)
      end

      def to_raw
        @parsed.deep_dup
      end
    end
  end
end
