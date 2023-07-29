# frozen_string_literal: true

RSpec.describe MetaDataHelper do
  describe '.page_title' do
    it 'calls i18n with default and kwargs' do
      allow(I18n).to receive(:t).with('helpers.meta.title.test.', default: 'helpers.meta.title.default', foo: 'bar')
                                .and_return('title')

      expect(helper.page_title(foo: 'bar')).to eq('title')
    end
  end

  describe '.page_description' do
    it 'calls i18n with default and kwargs' do
      allow(I18n).to receive(:t).with('helpers.meta.description.test.',
                                      default: 'helpers.meta.description.default',
                                      foo: 'bar')
                                .and_return('description')

      expect(helper.page_description(foo: 'bar')).to eq('description')
    end
  end

  describe '.page_keywords' do
    it 'calls i18n with default and kwargs' do
      allow(I18n).to receive(:t).with('helpers.meta.keywords.test.',
                                      default: 'helpers.meta.keywords.default',
                                      foo: 'bar')
                                .and_return('keywords')

      expect(helper.page_keywords(foo: 'bar')).to eq('keywords')
    end
  end

  describe '.page_robots' do
    it 'calls i18n with default and kwargs' do
      allow(I18n).to receive(:t).with('helpers.meta.robots.test.',
                                      default: 'helpers.meta.robots.default',
                                      foo: 'bar')
                                .and_return('robots')

      expect(helper.page_robots(foo: 'bar')).to eq('robots')
    end
  end
end
