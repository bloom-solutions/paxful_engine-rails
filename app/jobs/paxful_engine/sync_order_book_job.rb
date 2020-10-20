module PaxfulEngine
  class SyncOrderBookJob < ApplicationJob

    HOST = "https://paxful.com/api".freeze

    def perform
      client = PaxfulClient.new(
        host: HOST,
        key: PaxfulEngine.configuration.paxful_key,
        secret: PaxfulEngine.configuration.paxful_secret,
      )

      response = client.get_completed_trades
      return unless response.success?

      trades = response.parsed_body["data"]["trades"]

      trades.each do |payload|
        EnqueueCreateTradeJob.perform_async(payload)
      end
    end

  end
end
