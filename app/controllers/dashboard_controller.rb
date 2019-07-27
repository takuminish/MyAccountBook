class DashboardController < ApplicationController

    def index

        @date_purchases = []
        @week_date = []
        7.times do |d| 
            @week_date << (1.week.ago.beginning_of_day + d.day).strftime("%Y-%m-%d")
            @date_purchases  << DatePurchase.find_by(date: 1.week.ago.beginning_of_day + d.day)
        end
        p @date_purchases
        gon.date_purchase = @date_purchases
        gon.week = @week_date
    end

end
