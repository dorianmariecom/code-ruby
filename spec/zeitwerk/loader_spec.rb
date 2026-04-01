# frozen_string_literal: true

RSpec.describe Zeitwerk::Loader do
  it "eager loads without treating monkey patches as Code::Extensions constants" do
    expect { described_class.eager_load_all }.not_to raise_error
  end
end
