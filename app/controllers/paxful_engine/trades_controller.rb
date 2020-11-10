module PaxfulEngine
  class TradesController < ApplicationController

    def index
      @trades = Trade.order(completed_at: :desc, created_at: :desc)

      if params[:q] != "all"
        @trades = @trades.where.not(completed_at: nil)
      end
    end

    def show
      @trade = Trade.find(params[:id])
    end

  end
end
