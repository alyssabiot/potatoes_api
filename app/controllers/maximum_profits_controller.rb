class MaximumProfitsController < ApplicationController
  def index
    prices = MarketPrice.active_on(Time.zone.yesterday).order(:time).pluck(:value)

    max_profit = ProfitCalculator.for(prices)

    result = { maximum_profit_value: max_profit,
              maximum_profit_currency: "€" }

    render json: result
  end
end
