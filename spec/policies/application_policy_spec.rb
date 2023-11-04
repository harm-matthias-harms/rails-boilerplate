# frozen_string_literal: true

RSpec.describe ApplicationPolicy, type: :policy do
  subject(:policy) { described_class }

  permissions '.scope' do
    it 'throws not implemented error' do
      expect { described_class::Scope.new(nil, nil).resolve }
        .to raise_error(NotImplementedError, 'You must define #resolve in ApplicationPolicy::Scope')
    end
  end

  permissions :show?, :create?, :destroy?, :edit?, :index?, :new?, :update? do
    it { is_expected.not_to permit(nil, nil) }
  end
end
