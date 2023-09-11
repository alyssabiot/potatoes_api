require 'rails_helper'

RSpec.describe "MarketPrices API", type: :request do
  describe "GET /market_prices" do
    it "returns a successful response" do
      get '/market_prices'
      expect(response).to have_http_status(:ok)
    end

    it "returns JSON data" do
      get '/market_prices'
      expect(response.content_type).to eq("application/json; charset=utf-8")
    end

    it "returns the list of yesterday's market prices" do
      MarketPrice.create(time: 1.week.ago, value: 100.12)
      MarketPrice.create(time: Time.zone.yesterday + 2.hour, value: 100.25)
      MarketPrice.create(time: Time.zone.yesterday + 4.hour, value: 100.29)
      MarketPrice.create(time: Time.zone.yesterday + 6.hour, value: 100.29)

      get '/market_prices'
      json_response = JSON.parse(response.body)
      expect(json_response.size).to eq(3)
    end
  end
end
