require 'rails_helper'

RSpec.describe WebContentFetcher, :vcr do
  describe '#call' do
    let(:url) { 'http://example.com/' }

    subject { described_class.new(url, parser).call }

    context 'when parser is nil' do
      let(:parser) { nil }

      it 'return proper content' do
        subject.include?('Example Domain')
      end
    end

    context 'when parser is set' do
      let(:parser) { double(:parser) }

      before do
        allow(parser).to receive(:parse) do |content|
          content.upcase
        end
      end

      it 'return proper content' do
        subject.include?('EXAMPLE DOMAIN')
      end
    end
  end
end
