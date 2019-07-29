class DashboardController < ApplicationController

    def index

        @product = []
        @week_date_purchases = DatePurchase.cost_of_week(1)

        @year_date_purchases = DatePurchase.cost_of_year(1)

        @month_date_purchases = DatePurchase.cost_of_month(1)

        DatePurchase.cost_of_product_category_by_year(0).each do |p|
           @product << p.attributes
        end

        gon.week_date_purchase = @week_date_purchases
        gon.year_date_purchase = @year_date_purchases
        gon.month_date_purchase = @month_date_purchases

        gon.product = @product
        
    end

end
