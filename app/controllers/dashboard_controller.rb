class DashboardController < ApplicationController

    def index

        @week_date_purchases = []
        @product = []
        @week_date = []
        7.times do |d| 
            @week_date << (Date.today.beginning_of_year + d.month).strftime("%Y-%m-%d")
            @week_date_purchases  << DatePurchase.find_by(date: 1.week.ago.beginning_of_day + d.day)
        end
        @year_date = []
        @year_date_purchases = []
        12.times do |d| 
            @year_date << (Date.today.beginning_of_year + d.month).strftime("%Y-%m")
            @year_date_purchases  << DatePurchase.where(date: (Date.today.beginning_of_year + d.month)..(Date.today.beginning_of_year.end_of_month+ d.month)).sum(:total_cost)
        end

        @month_date = []
        @month_date_purchases = []
        4.times do |d|
            @month_date << (Date.today.beginning_of_month.beginning_of_week + d.week).strftime("%m-%d week")
            @month_date_purchases << DatePurchase.where(date: (Date.today.beginning_of_month.beginning_of_week + d.week)..(Date.today.beginning_of_month.end_of_week + d.week)).sum(:total_cost)
        end
        if ((Date.today.beginning_of_month.beginning_of_week + 5.week) < Date.today.end_of_month)
            @month_date_purchases << DatePurchase.where(date: (Date.today.beginning_of_month.beginning_of_week + 5.week)..(Date.today.end_of_month)).sum(:total_cost)
        end




        DatePurchase.joins({:store_purchases => {:products => :product_category}}).select("product_category_id, product_categories.name, sum(products.price) AS total_cost").group("products.product_category_id").where(date: 1.week.ago.beginning_of_day..Time.zone.now.end_of_day).each do |p|
           @product << p.attributes
        end

        @month = DatePurchase.where(date: Date.today.beginning_of_month..Date.today.end_of_month.end_of_month).group("strftime('%Y-%W weeks', date)").sum(:total_cost)


        p @date_purchases
        gon.week_date_purchase = @week_date_purchases
        gon.year_date_purchase = @year_date_purchases
        gon.year = @year_date
        gon.week = @week_date
        gon.month_date_purchase = @month_date_purchases
        gon.month = @month_date
        gon.product = @product
        
    end

end
