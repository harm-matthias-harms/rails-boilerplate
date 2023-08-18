# frozen_string_literal: true

RSpec.configure do |config|
  config.before do
    allow(Truemail).to receive(:valid?).and_return(true)
  end
end
