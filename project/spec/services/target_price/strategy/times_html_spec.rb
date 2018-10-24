require 'rails_helper'

RSpec.describe TargetPrice::Strategy::TimesHtml do
  include_context 'web_content_fetcher for strategy' do
    let(:url) { 'http://time.com' }
    let(:parser) { HtmlDomParser }

    let(:html_nodes) { double(:html_nodes) }

    before do
      allow(html_nodes).to receive(:search).with('*').and_return((1..1100).to_a)
    end

    let(:parsed_content) do
      html_nodes
    end
  end

  describe '#call' do
    subject { described_class.new(web_content_fetcher_class).call }

    it 'returns proper value' do
      is_expected.to eq 11
    end
  end
end
