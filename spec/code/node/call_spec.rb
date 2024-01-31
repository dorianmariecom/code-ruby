# frozen_string_literal: true

require "spec_helper"

RSpec.describe Code::Node::Call do
  #   let(:context) { <<~CONTEXT }
  #     render = (*args, **kargs, &block) => {
  #       [args, kargs, block&.call(:dorian)]
  #     }
  #
  #     { render:, user: { name: :Dorian } }"
  #   CONTEXT
  #
  #   [
  #     ["render", "[[], {}, nothing]"],
  #     ["render()", "[[], {}, nothing]"],
  #     ["render(user)", "[[user], {}, nothing]"],
  #     [
  #       "render(user, first_name: :Dorian)",
  #       "[[user], { first_name: :Dorian }, nothing]"
  #     ],
  #     ["render { }", "[[], {}, nothing]"],
  #     ["render do end", "[[], {}, nothing]"],
  #     ["render { |name| name.upcase }", "[[], {}, :Dorian]"],
  #     ["render(user) { |name| name.upcase }", "[[user], {}, :Dorian]"],
  #     ["render(user) do |name| name.upcase end", "[[user], {}, :Dorian]"],
  #     ["render { :Dorian }", "[[], {}, :Dorian]"],
  #     ["render(user) { :Dorian }", "[[user], {}, :Dorian]"],
  #     ["render(user) do :Dorian end", "[[user], {}, :Dorian]"]
  #   ].each do |input, expected|
  #     it "#{input} == #{expected}" do
  #       expect(Code.evaluate(input, context)).to eq(
  #         Code.evaluate(expected, context)
  #       )
  #     end
  #   end
end
