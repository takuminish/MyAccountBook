class DashboardController < ApplicationController

    def index

        gon.week_date_purchase = DatePurchase.cost_of_week(1)
        gon.year_date_purchase = DatePurchase.cost_of_year(1)
        gon.month_date_purchase = DatePurchase.cost_of_month(1)
        gon.product_category_by_week = DatePurchase.cost_of_product_category_week(0)
        gon.product_category_by_month = DatePurchase.cost_of_product_category_month(0)
        gon.product_category_by_year = DatePurchase.cost_of_product_category_year(0)
        gon.next_num = 0
        
    end


    def ajax_get_week_purchase_data
        next_num = params[:next_num]
        gon.week_date_purchase = DatePurchase.cost_of_week(num)
        gon.product_category_by_week = DatePurchase.cost_of_product_category_week(num)
        gon.next_num = next_num

        render partial: "share/gon_partial"
        render nothing: true

    end

    def ajax_get_month_purchase_data
        gon.month_date_purchase = DatePurchase.cost_of_month(num)
        gon.product_category_by_month = DatePurchase.cost_of_product_category_month(num)
        gon.next_num = next_num

        render partial: "share/gon_partial"
        render nothing: true

    end

    def ajax_get_year_purchase_data
        gon.year_date_purchase = DatePurchase.cost_of_year(num)
        gon.product_category_by_year = DatePurchase.cost_of_product_category_year(num)
        gon.next_num = next_num

        render partial: "share/gon_partial"
        render nothing: true

    end
end
