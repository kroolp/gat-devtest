module TargetPrice
  class StrategyFinder
    attr_reader :code

    def initialize(code)
      @code = code
    end

    def call
      strategy_class.new
    end

    private

    def strategy_class
      case code
      when 'times_a'
        Strategy::TimesA
      when '10_arrays'
        Strategy::TenArrays
      when 'times_html'
        Strategy::TimesHtml
      end
    end
  end
end
