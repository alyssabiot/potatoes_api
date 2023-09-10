class MarketPricesController < ApplicationController
  def index
    @market_prices = MarketPrice.active_on(Time.zone.yesterday).order(:time)
    render json: @market_prices
  end
end
