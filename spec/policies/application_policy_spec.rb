# frozen_string_literal: true

RSpec.describe ApplicationPolicy do
  subject(:policy) { described_class }

  permissions '.scope' do
    it 'throws not implemented error' do
      expect { described_class::Scope.new(nil, nil).resolve }
        .to raise_error(NotImplementedError, 'You must define #resolve in ApplicationPolicy::Scope')
    end
  end

  permissions :show?, :create?, :destroy?, :edit?, :index?, :new?, :update? do
    it 'denies access to public' do
      expect(policy).not_to permit(nil, nil)
    end
  end
end
