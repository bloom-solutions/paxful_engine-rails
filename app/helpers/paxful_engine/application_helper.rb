module PaxfulEngine
  module ApplicationHelper

    def highlight_status(trade)
      status = trade.status.downcase
      status == "successful" ? "text-success" : "text-danger"
    end

  end
end
