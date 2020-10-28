module PaxfulEngine
  class Trade < ApplicationRecord

    validates(
      :trade_hash,
      :offer_hash,
      :offer_type,
      :fiat_amount_requested,
      :fiat_currency_code,
      :crypto_amount_requested,
      :crypto_currency_code,
      :started_at,
      :ended_at,
      :seller,
      :buyer,
      :status,
      presence: true
    )

    def successful?
      status.downcase == "successful"
    end

    def buy?
      offer_type.downcase == "buy"
    end

    def sell?
      offer_type.downcase == "sell"
    end

  end
end
