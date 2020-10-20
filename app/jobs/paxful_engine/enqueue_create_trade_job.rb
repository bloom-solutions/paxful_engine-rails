module PaxfulEngine
  class EnqueueCreateTradeJob < ApplicationJob

    sidekiq_options retry: false
    
    def perform(payload)
      CreateTrade.(payload)
    end

  end
end
