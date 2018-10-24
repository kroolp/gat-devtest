module TargetPrice
  module Strategy
    class TimesHtml < Base
      def call
        parsed_content.search('*').count / 100
      end

      private

      def url
        'http://time.com'
      end

      def parser
        HtmlDomParser
      end
    end
  end
end
