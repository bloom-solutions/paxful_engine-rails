FactoryBot.define do

  factory :paxful_engine_trade, class: "PaxfulEngine::Trade" do
    trade_hash { "trade-hash" }
    offer_hash { "offer-hash" }
    offer_type { "buy" }
    crypto_amount_requested { 0.05 }
    crypto_currency_code { "BTC" }
    fiat_amount_requested { 1_000 }
    fiat_currency_code { "PHP" }
    started_at { Time.current }
    ended_at { Time.current + 2.days }
    status { "successful" }
  end

end
