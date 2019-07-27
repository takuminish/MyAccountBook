class DashboardController < ApplicationController

    def index

        @date_purchases = DatePurchase.where(date: 1.week.ago.beginning_of_day..Time.zone.now.end_of_day)
        gon.date_purchase = @date_purchases
    end

end
