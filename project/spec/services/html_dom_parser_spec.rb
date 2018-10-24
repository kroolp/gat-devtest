require 'rails_helper'

RSpec.describe HtmlDomParser do
  let(:content) do
    <<-HTML
      <!DOCTYPE html>
      <html>
        <head>
          <title>Test</title>
        </head>
        <body>
        </body>
      <html>
    HTML
  end

  describe '.parse' do
    subject { described_class.parse(content) }

    it 'returns Nokogiri::HTML::Document with specified content' do
      is_expected.to be_a Nokogiri::HTML::Document

      expect(subject.text.strip).to eq 'Test'
    end
  end
end
