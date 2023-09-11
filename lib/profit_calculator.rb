class ProfitCalculator
  MAXIMUM_BUY = 100

  def self.for(market_prices)
    max_unit_profit = 0
    min_price = market_prices[0]

    market_prices.each do |price|
      if price < min_price
        min_price = price
      else
        unit_profit = price - min_price
        max_unit_profit = unit_profit if unit_profit > max_unit_profit
      end
    end

    (max_unit_profit * MAXIMUM_BUY).round(2)
  end
end
