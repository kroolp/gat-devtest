module TargetPrice
  module Strategy
    class Base
      attr_reader :web_content_fetcher

      def initialize(web_content_fetcher = WebContentFetcher)
        @web_content_fetcher = web_content_fetcher
      end

      def call
        raise NotImplementedError
      end

      private

      def parsed_content
        web_content_fetcher.new(url, parser).call
      end

      def url
        raise NotImplementedError
      end

      def parser
        nil
      end
    end
  end
end
