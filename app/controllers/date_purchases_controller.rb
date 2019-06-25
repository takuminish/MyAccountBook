class DatePurchasesController < ApplicationController
  def index
  end

  def show
  end

  def new
    @date_purchase = DatePurchase.new
    @date_purchase.products.build
  end

  def create
    @date_purchase = DatePurchase.new(date_purchase_params)
    if @date_purchase.save

    else
      puts @date_purchase.errors.full_messages
    end
 
  end
  def edit
  end


  private def date_purchase_params
  
  params.require(:date_purchase).permit(:total_cost, :date, products_attributes:[:name, :price, :purchase_date, :store_id, :product_category_id])
  end
end
