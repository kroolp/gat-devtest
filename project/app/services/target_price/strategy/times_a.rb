module TargetPrice
  module Strategy
    class TimesA < Base
      def call
        parsed_content.count('a') / 100
      end

      private

      def url
        'http://time.com'
      end
    end
  end
end
