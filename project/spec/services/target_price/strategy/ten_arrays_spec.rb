require 'rails_helper'

RSpec.describe TargetPrice::Strategy::TenArrays do
  include_context 'web_content_fetcher for strategy' do
    let(:url) { 'http://openlibrary.org/search.json?q=the+lord+of+the+rings' }
    let(:parser) { JSON }

    let(:parsed_content) do
      { a: { b: 'c' }, d: (1..10).to_a,  e: ([{ a: (1..11).to_a }] * 200) }
    end
  end

  describe '#call' do
    subject { described_class.new(web_content_fetcher_class).call }

    it 'returns proper value' do
      is_expected.to eq 2
    end
  end
end
