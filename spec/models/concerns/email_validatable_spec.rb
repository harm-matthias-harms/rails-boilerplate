# frozen_string_literal: true

class Dummy
  include ActiveModel::Model
  include ActiveModel::Attributes
  include Truemailable

  attribute :email
end

RSpec.describe EmailValidatable do
  let(:dummy) { Dummy.new(email: Faker::Internet.email) }

  describe '.validate_email_by_truemail' do
    it 'validates email by Truemail' do
      expect(Truemail).to receive(:valid?).with(dummy.email, with: :mx_blacklist)

      dummy.valid?
    end

    context 'when email is valid' do
      it 'does not add error to email' do
        dummy.valid?

        expect(dummy.errors[:email]).to be_empty
      end
    end

    context 'when email is invalid' do
      before do
        allow(Truemail).to receive(:valid?).and_return(false)
      end

      it 'adds error to email' do
        dummy.valid?

        expect(dummy.errors[:email]).to include 'is invalid'
      end
    end
  end
end
