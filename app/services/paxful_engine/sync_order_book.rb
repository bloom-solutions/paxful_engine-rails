module PaxfulEngine
  class SyncOrderBook

    HOST = "https://paxful.com/api".freeze
    DEFAULT_PAGE = 1.freeze

    def self.call(page: DEFAULT_PAGE, max_page: nil)
      response = client.get_completed_trades(page: page)
      return unless response.success?
      return if response.parsed_body.nil?
      return if response.parsed_body["data"].nil?
      return if response.parsed_body["data"]["trades"].nil?

      trades = response.parsed_body["data"]["trades"]
      return if trades.empty?

      unsynced_trades = trades.select do |payload|
        Trade.where(trade_hash: payload["trade_hash"]).none?
      end
      unsynced_trades.each { |payload| EnqueueCreateTradeJob.perform_async(payload) }

      return if unsynced_trades.none?
      return if max_page == page

      self.(page: page + 1, max_page: max_page)
    end

    def self.client
      PaxfulClient.new(
        host: HOST,
        key: PaxfulEngine.configuration.paxful_key,
        secret: PaxfulEngine.configuration.paxful_secret,
      )
    end
    private_class_method :client

  end
end
