# frozen_string_literal: true

RSpec.describe MetaDataHelper do
  describe '.page_title' do
    before do
      allow(I18n).to receive(:t).with('helpers.meta.title.default').and_return('title')
      allow(I18n).to receive(:t).with('helpers.meta.title.test.', default: 'title', foo: 'bar').and_return('title')
    end

    it { expect(helper.page_title(foo: 'bar')).to eq('title') }
  end

  describe '.page_description' do
    before do
      allow(I18n).to receive(:t).with('helpers.meta.description.default').and_return('description')
      allow(I18n).to receive(:t).with('helpers.meta.description.test.', default: 'description', foo: 'bar')
                                .and_return('description')
    end

    it { expect(helper.page_description(foo: 'bar')).to eq('description') }
  end

  describe '.page_keywords' do
    before do
      allow(I18n).to receive(:t).with('helpers.meta.keywords.default').and_return('keywords')
      allow(I18n).to receive(:t).with('helpers.meta.keywords.test.', default: 'keywords', foo: 'bar')
                                .and_return('keywords')
    end

    it { expect(helper.page_keywords(foo: 'bar')).to eq('keywords') }
  end

  describe '.page_robots' do
    before do
      allow(I18n).to receive(:t).with('helpers.meta.robots.default').and_return('robots')
      allow(I18n).to receive(:t).with('helpers.meta.robots.test.', default: 'robots', foo: 'bar')
                                .and_return('robots')
    end

    it { expect(helper.page_robots(foo: 'bar')).to eq('robots') }
  end
end
