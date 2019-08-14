class DashboardController < ApplicationController

    def index

        gon.week_date_purchase = DatePurchase.cost_of_week(0)
        gon.year_date_purchase = DatePurchase.cost_of_year(0)
        gon.month_date_purchase = DatePurchase.cost_of_month(0)
        gon.product_category_by_week = DatePurchase.cost_of_product_category_week(0)
        gon.product_category_by_month = DatePurchase.cost_of_product_category_month(0)
        gon.product_category_by_year = DatePurchase.cost_of_product_category_year(0)
        gon.next_num = 0
        
    end


    def ajax_get_week_purchase_data
        next_num = params[:next_num].to_i
        gon.week_date_purchase = DatePurchase.cost_of_week(next_num)
        gon.product_category_by_week = DatePurchase.cost_of_product_category_week(next_num)
        gon.next_num = next_num
        render partial: "shared/gon_partial"
     #   render nothing: true

    end

    def ajax_get_month_purchase_data
        next_num = params[:next_num].to_i
        gon.month_date_purchase = DatePurchase.cost_of_month(next_num)
        gon.product_category_by_month = DatePurchase.cost_of_product_category_month(next_num)
        gon.next_num = next_num

        render partial: "shared/gon_partial"
        #render nothing: true

    end

    def ajax_get_year_purchase_data
        next_num = params[:next_num].to_i
        gon.year_date_purchase = DatePurchase.cost_of_year(next_num)
        gon.product_category_by_year = DatePurchase.cost_of_product_category_year(next_num)
        gon.next_num = next_num

        render partial: "shared/gon_partial"
     #   render nothing: true

    end
end
