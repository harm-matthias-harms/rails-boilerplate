# frozen_string_literal: true

RSpec.describe ApplicationController do
  it { expect(described_class.ancestors).to include(Flashable) }
  it { expect(described_class.ancestors).to include(Pundit::Authorization) }
end
