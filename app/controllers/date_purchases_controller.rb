class DatePurchasesController < ApplicationController
  def index
  end

  def show
  end

  def new
    @date_purchase = DatePurchase.new
    @date_purchase.product.build
  end

  def create
    @date_purchase = DatePurchase.new(date_purchase_params)
    @date_purchase.save
  end
  def edit
  end


  private def date_purchase_params
  
  params.require(:date_purchase).permit(:totalcost, :date, products_attributes:[:name, :price, :purchase_date, :store_id, :product_category_id])
  end
end
