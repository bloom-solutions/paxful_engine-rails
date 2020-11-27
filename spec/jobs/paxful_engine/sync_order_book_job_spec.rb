require "spec_helper"

module PaxfulEngine
  RSpec.describe SyncOrderBookJob do

    it "calls SyncOrderBook" do
      expect(SyncOrderBook).to receive(:call)
      described_class.new.perform
    end

  end
end
