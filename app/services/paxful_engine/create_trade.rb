module PaxfulEngine
  class CreateTrade

    def self.call(payload)
      trade = Trade.where(trade_hash: payload["trade_hash"]).first_or_create! do |paxful_trade|
        paxful_trade.offer_hash = payload["offer_hash"]
        paxful_trade.offer_type = payload["offer_type"]
        paxful_trade.fiat_amount_requested = BigDecimal(payload["fiat_amount_requested"])
        paxful_trade.fiat_currency_code = payload["fiat_currency_code"]
        paxful_trade.crypto_amount_requested = BigDecimal(payload["crypto_amount_requested"])
        paxful_trade.crypto_currency_code = payload["crypto_currency_code"]
        paxful_trade.payment_method_name = payload["payment_method_name"]
        paxful_trade.started_at = payload["started_at"]
        paxful_trade.ended_at = payload["ended_at"]
        paxful_trade.seller = payload["seller"]
        paxful_trade.buyer = payload["buyer"]
        paxful_trade.completed_at = payload["completed_at"]
        paxful_trade.status = payload["status"]
      end

      if PaxfulEngine.configuration.on_sync_callback.present?
        callback = PaxfulEngine.configuration.on_sync_callback
        callback.constantize.(trade)
      end

      trade

    rescue => exception
      if PaxfulEngine.configuration.on_failure_callback.present?
        callback = PaxfulEngine.configuration.on_failure_callback
        callback.constantize.(exception, payload)
      end
    end

  end
end
