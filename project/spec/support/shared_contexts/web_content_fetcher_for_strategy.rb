RSpec.shared_context 'web_content_fetcher for strategy' do
  let(:web_content_fetcher_class) { double(:web_content_fetcher_class) }
  let(:web_content_fetcher) { double(:web_content_fetcher) }

  before do
    allow(web_content_fetcher_class).to receive(:new)
      .with(url, parser).and_return(web_content_fetcher)

    allow(web_content_fetcher).to receive(:call).and_return(parsed_content)
  end

  let(:parsed_content) do
    { a: { b: 'c' }, d: (1..10).to_a,  e: ([{ a: (1..11).to_a }] * 200) }
  end
end
