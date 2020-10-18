require "spec_helper"

module PaxfulRails
  RSpec.describe SyncOrderBookJob, vcr: { record: :once } do

    it "runs EnqueueCreateTradeJob multiple times" do
      expect(EnqueueCreateTradeJob).to receive(:perform_async).at_least(1).times
      described_class.new.perform
    end

  end
end
