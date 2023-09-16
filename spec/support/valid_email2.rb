# frozen_string_literal: true

RSpec.configure do |config|
  config.before do |example|
    next if example.metadata[:validate_email]

    address = instance_double(ValidEmail2::Address)
    allow(ValidEmail2::Address).to(receive(:new).and_return(address))
    allow(address).to(receive_messages(
                        valid?: true,
                        valid_mx?: true,
                        valid_strict_mx?: true,
                        mx_server_is_in?: false,
                        disposable?: false
                      ))
  end
end
