class DatePurchasesController < ApplicationController
  def index
    @date_purchase = DatePurchase.all
  end

  def show
    @date_purchase = DatePurchase.find(params[:id])
  end

  def new
    @date_purchase = DatePurchase.new
    store_purchase = @date_purchase.store_purchases.build
    store_purchase.products.build
  end

  def create
    @date_purchase = DatePurchase.new(date_purchase_params)
    @date_purchase.total_cost_insert
    if @date_purchase.save

    else
      puts @date_purchase.errors.full_messages
    end
 
  end
  def edit
    @date_purchase = DatePurchase.find(params[:id])

  end

  def update
    @date_purchase = DatePurchase.find(params[:id])
    @date_purchase.update(date_purchase_params_update)
    @date_purchase.total_cost_insert
    if @date_purchase.save
      redirect_back(fallback_location: stores_path)

    else
      puts @date_purchase.errors.full_messages
      render :edit
    end


  end


  private def date_purchase_params
  
  params.require(:date_purchase).permit(:date, store_purchases_attributes:[:store_id,products_attributes:[:name, :price, :product_category_id]])
  end

  private def date_purchase_params_update
  
    params.require(:date_purchase).permit(:date, store_purchases_attributes:[:id, :_destroy, :store_id,products_attributes:[:id, :_destroy, :name, :price, :product_category_id, ]])
  end
end
