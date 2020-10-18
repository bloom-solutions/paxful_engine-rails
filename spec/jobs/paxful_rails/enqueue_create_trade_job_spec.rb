require "spec_helper"

module PaxfulRails
  RSpec.describe EnqueueCreateTradeJob do

    let(:payload) { "some payload" }

    it "calls CreateTrade" do
      expect(CreateTrade).to receive(:call).with(payload)
      described_class.new.perform(payload)
    end

  end
end
