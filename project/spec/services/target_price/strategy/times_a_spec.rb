require 'rails_helper'

RSpec.describe TargetPrice::Strategy::TimesA do
  include_context 'web_content_fetcher for strategy' do
    let(:url) { 'http://time.com' }
    let(:parser) { nil }

    let(:parsed_content) do
      "abc#{'a'*299}efg"
    end
  end

  describe '#call' do
    subject { described_class.new(web_content_fetcher_class).call }

    it 'returns proper value' do
      is_expected.to eq 3
    end
  end
end
