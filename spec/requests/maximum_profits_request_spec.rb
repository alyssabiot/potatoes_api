require 'rails_helper'

RSpec.describe "MaximumProfits API", type: :request do
  describe "GET /maximum_profits/index" do
    it "returns a successful response" do
      get '/maximum_profits/index'
      expect(response).to have_http_status(:ok)
    end

    it "returns JSON data" do
      get '/maximum_profits/index'
      expect(response.content_type).to eq("application/json; charset=utf-8")
    end

    it "returns yesterday's maximum profit" do
      MarketPrice.create(time: Time.zone.yesterday + 2.hour, value: 100.25)
      MarketPrice.create(time: Time.zone.yesterday + 4.hour, value: 100.29)
      MarketPrice.create(time: Time.zone.yesterday + 6.hour, value: 100.29)

      get '/maximum_profits/index'
      json_response = JSON.parse(response.body)
      expect(json_response).to eq("4.0 €")
    end
  end
end
