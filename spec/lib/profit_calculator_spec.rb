require "rails_helper"

RSpec.describe ProfitCalculator do
  describe ".for" do
    subject(:max_profit) { described_class.for(market_prices) }

    context "when market prices are empty" do
      let(:market_prices) { [] }

      it { is_expected.to eq 0 }
    end

    context "when market prices are stable (same price all day)" do
      let(:market_prices) { [99] }

      it { is_expected.to eq 0 }
    end

    context "when market prices are going down" do
      let(:market_prices) { [99, 98, 97, 96] }

      it { is_expected.to eq 0 }
    end

    context "when market prices are going up" do
      let(:market_prices) { [96, 97, 98, 99] }

      # (99-96)*100 -> 300
      it { is_expected.to eq 300 }
    end

    context "when market prices are fluctuating" do
      let(:market_prices) { [96, 94, 98, 96, 98, 100, 98, 97, 93] }

      # (100-94)*100 -> 600
      it { is_expected.to eq 600 }
    end
  end
end
