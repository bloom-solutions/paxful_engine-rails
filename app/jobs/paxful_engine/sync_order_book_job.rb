module PaxfulEngine
  class SyncOrderBookJob < ApplicationJob

    def perform
      SyncOrderBook.()
    end

  end
end
