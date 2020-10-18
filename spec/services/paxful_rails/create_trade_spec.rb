require "spec_helper"

module PaxfulRails
  RSpec.describe CreateTrade do

    let(:payload) do
      {
        "trade_hash"=>"kEf44Ldnr91",
        "offer_hash"=>"pbg1ftsnPdH",
        "offer_type"=>"sell",
        "fiat_amount_requested"=>"10000.00",
        "fiat_currency_code"=>"PHP",
        "crypto_amount_requested"=>1798624,
        "crypto_currency_code"=>"BTC",
        "payment_method_name"=>"Bank Transfer",
        "started_at"=>"2020-10-12 08:19:55",
        "ended_at"=>"2020-10-12 08:52:03",
        "seller"=>"Bloomx",
        "buyer"=>"angelikadumlao",
        "completed_at"=>nil,
        "status"=>"cancelled",
      }
    end

    context "trade_hash does not exist" do
      class SyncCallback
        def self.call(paxful_trade)
        end
      end

      before do
        PaxfulRails.configuration.on_sync_callback = "::PaxfulRails::SyncCallback"
      end

      it "creates a Trade; and runs the callback" do
        expect(SyncCallback).to receive(:call)

        paxful_trade = described_class.(payload)

        expect(paxful_trade).to be_persisted
        expect(paxful_trade.trade_hash).to eq "kEf44Ldnr91"
      end
    end

    context "trade_hash already exists" do
      before do
        described_class.(payload)
      end

      it "does not create a duplicate" do
        expect(Trade.all.count).to eq 1

        described_class.(payload)

        expect(Trade.all.count).to eq 1
      end
    end

  end
end
