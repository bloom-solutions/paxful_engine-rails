module PaxfulEngine
  module ApplicationHelper

    def highlight_status(trade)
      status = trade.status.downcase
      status == "successful" ? "text-success" : "text-danger"
    end

    def format_datetime(datetime, timezone = "Asia/Manila")
      return "-" if datetime.nil?
      datetime.in_time_zone(timezone).strftime("%m/%d/%Y %I:%M%p")
    end

  end
end
