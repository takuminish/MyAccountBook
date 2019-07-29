class DashboardController < ApplicationController

    def index

        @week_date_purchases = []
        @product = []
        @week_date = []
        7.times do |d| 
            @week_date << (1.week.ago.beginning_of_day + d.day).strftime("%Y-%m-%d")
            @week_date_purchases  << DatePurchase.cost_date_by_week(d)
        end
        @year_date = []
        @year_date_purchases = []
        12.times do |d| 
            @year_date << (Date.today.beginning_of_year + d.month).strftime("%Y-%m")
            @year_date_purchases  << DatePurchase.cost_month_by_year(d);
        end

        @month_date = []
        @month_date_purchases = []
        4.times do |d|
            @month_date << (Date.today.beginning_of_month.beginning_of_week + d.week).strftime("%m-%d week")
            @month_date_purchases << DatePurchase.cost_week_by_month(d)
        end
        if ((Date.today.beginning_of_month.beginning_of_week + 5.week) < Date.today.end_of_month)
            @month_date_purchases << DatePurchase.cost_week_by_month(5)
        end

        DatePurchase.cost_of_product_category_by_year(0).each do |p|
           @product << p.attributes
        end

        gon.week_date_purchase = @week_date_purchases
        gon.year_date_purchase = @year_date_purchases
        gon.year = @year_date
        gon.week = @week_date
        gon.month_date_purchase = @month_date_purchases
        gon.month = @month_date
        gon.product = @product
        
    end

end
