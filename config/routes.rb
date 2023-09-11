Rails.application.routes.draw do
  root "market_prices#index"

  resources :market_prices, only: %i[index]
  resources :maximum_profits, only: %i[index]
end
