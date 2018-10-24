module TargetPrice
  module Strategy
    class TenArrays < Base
      def call
        ten_arrays_count(parsed_content.values) / 100
      end

      private

      def ten_arrays_count(elements)
        elements.sum do |element|
          count = 0

          if element.is_a?(Array)
            count = 1 if element.count > 10
            count += ten_arrays_count(element)
          elsif element.is_a?(Hash)
            count += ten_arrays_count(element.values)
          end

          count
        end
      end

      def url
        'http://openlibrary.org/search.json?q=the+lord+of+the+rings'
      end

      def parser
        JSON
      end
    end
  end
end
