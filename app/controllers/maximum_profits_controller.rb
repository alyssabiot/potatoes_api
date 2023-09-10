class MaximumProfitsController < ApplicationController
  MAXIMUM_BUY = 100

  def index
    prices = MarketPrice.active_on(Time.zone.yesterday).order(:time).pluck(:value)

    max_profit = 0
    min_price = prices[0]

    prices.each do |price|
      if price < min_price
        min_price = price
      else
        profit = (price - min_price).abs
        max_profit = profit if profit > max_profit
      end
    end

    max_profit *= MAXIMUM_BUY

    result = "#{max_profit.round(2)} €".to_json

    render json: result
  end
end
