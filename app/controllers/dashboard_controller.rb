class DashboardController < ApplicationController

    def index

        @product = []
        @week_date_purchases = DatePurchase.cost_of_week(1)

        @year_date = []
        @year_date_purchases = []
        12.times do |d| 
            @year_date << (Date.today.beginning_of_year + d.month).strftime("%Y-%m")
            @year_date_purchases  << DatePurchase.cost_month_by_year(d);
        end

        @month_date = []
        @month_date_purchases = DatePurchase.cost_of_month(1)

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
