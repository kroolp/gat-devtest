module TargetPrice
  class Calculator
    attr_reader :panel_provider

    def initialize(panel_provider)
      @panel_provider = panel_provider
    end

    def call
      price_strategy.call
    end

    private

    def price_strategy
      StrategyFinder.new(panel_provider.code).call
    end
  end
end
