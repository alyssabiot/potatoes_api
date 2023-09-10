Rails.application.routes.draw do
  root "market_prices#index"

  get "market_prices/index"
  get "maximum_profits/index"
end
