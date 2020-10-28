require "spec_helper"

module PaxfulEngine
  RSpec.describe Trade do

    describe "#successful?" do
      let(:paxful_engine_trade) { build(:paxful_engine_trade, status: status) }

      context "status = cancelled" do
        let(:status) { "cancelled" }

        it "returns false" do
          expect(paxful_engine_trade).not_to be_successful
        end
      end

      context "status = successful" do
        let(:status) { "successful" }

        it "returns true" do
          expect(paxful_engine_trade).to be_successful
        end
      end
    end

    describe "#buy? and #sell?" do
      let(:paxful_engine_trade) { build(:paxful_engine_trade, offer_type: offer_type) }

      context "offer_type = buy" do
        let(:offer_type) { "buy" }

        it "buy? returns true" do
          expect(paxful_engine_trade).to be_buy
        end
      end

      context "offer_type = sell" do
        let(:offer_type) { "sell" }

        it "sell? returns true" do
          expect(paxful_engine_trade).to be_sell
        end
      end
    end

  end
end
