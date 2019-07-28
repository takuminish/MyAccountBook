class DashboardController < ApplicationController

    def index

        @date_purchases = []
        @product = []
        @week_date = []
        7.times do |d| 
            @week_date << (1.week.ago.beginning_of_day + d.day).strftime("%Y-%m-%d")
            @date_purchases  << DatePurchase.find_by(date: 1.week.ago.beginning_of_day + d.day)
        end
        DatePurchase.joins({:store_purchases => {:products => :product_category}}).select("product_category_id, product_categories.name, sum(products.price) AS total_cost").group("products.product_category_id").where(date: 1.week.ago.beginning_of_day..Time.zone.now.end_of_day).each do |p|
           @product << p.attributes
        end

        p @date_purchases
        gon.date_purchase = @date_purchases
        gon.week = @week_date
        gon.product = @product
    end

end
