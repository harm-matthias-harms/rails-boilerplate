# frozen_string_literal: true

RSpec.describe User do
  it { expect(described_class.ancestors).to include EmailValidatable }
end
