require "spec_helper"

module PaxfulEngine
  RSpec.describe SyncOrderBook, vcr: { record: :once } do

    it "fetches and creates trades" do
      expect(EnqueueCreateTradeJob).to receive(:perform_async).at_least(:once)
      described_class.(max_page: 2)
    end

  end
end
