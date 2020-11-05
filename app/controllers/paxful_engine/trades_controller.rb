module PaxfulEngine
  class TradesController < ApplicationController

    def index
      @trades = Trade.order("completed_at DESC, created_at DESC")
    end

    def show
      @trade = Trade.find(params[:id])
    end

  end
end
