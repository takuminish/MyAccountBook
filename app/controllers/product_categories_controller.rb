class ProductCategoriesController < ApplicationController
  
  def index
    @product_categories = ProductCategory.all
  end
  def new

    @product_category = ProductCategory.new

  end

  def create
    
    @product_category = ProductCategory.new(product_category_params)
    if @product_category.save
      redirect_to product_categories_url

    else
      puts @product_category.errors.full_messages
      render :edit
    end

  end

  def edit
    @product_category = ProductCategory.find(params[:id])
  end

  def update
    @product_category = ProductCategory.find(params[:id])
    @product_category.update(product_category_params)
  end

  private def product_category_params

    params.require(:product_category).permit(:name, :expense)

  end
end
