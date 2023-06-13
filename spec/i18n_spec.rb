# frozen_string_literal: true

require 'i18n/tasks'

RSpec.describe I18n do
  let(:i18n) { I18n::Tasks::BaseTask.new }

  it 'does not have missing keys' do
    missing_keys = i18n.missing_keys

    expect(missing_keys).to be_empty, "Missing #{missing_keys.leaves.size} translations, run `i18n-tasks missing`"
  end

  it 'does not have unused keys' do
    unused_keys = i18n.unused_keys

    expect(unused_keys).to be_empty, "Missing #{unused_keys.leaves.size} translations, run `i18n-tasks missing`"
  end

  it 'has normalized files' do
    not_normalized = i18n.non_normalized_paths

    expect(not_normalized).to be_empty, 'Translations are not normalized, run `i18n-tasks normalize`'
  end

  it 'does not have inconsistent interpolation' do
    inconsistent_interpolation = i18n.inconsistent_interpolations

    expect(inconsistent_interpolation)
      .to be_empty, 'Inconsistent translation interpolation, run `i18n-tasks check-consistent-interpolations`'
  end
end
