module PaxfulEngine
  class TradesController < ApplicationController

    def index
      @trades = Trade.all
    end

  end
end
