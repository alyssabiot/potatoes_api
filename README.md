# README

This is an API that allows you to get all market prices for potatoes for yesterday and the maximum profit you could have made if you were the ultimate potato trader.

### To start the project

- Run `bundle install`
- Run `rails db:setup` to create the database and seed it
- Run `rails server`

### See the API responses

- Go to `http://localhost:3000/market_prices/index` to see all market prices for yesterday
- Go to `http://localhost:3000/maximum_profits/index` to see the maximum profit for yesterday

### Run tests

You can run the API's test suite by running `bundle exec rspec`
