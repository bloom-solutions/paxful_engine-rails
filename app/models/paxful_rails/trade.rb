module PaxfulRails
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

  end
end
