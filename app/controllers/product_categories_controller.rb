class ProductCategoriesController < ApplicationController
  def new

    @product_category = ProductCategory.new

  end

  def create
    
    @product_category = ProductCategory.new(product_category_params)
    @product_category.save

  end

  private def product_category_params

    params.require(:product_category).permit(:name)

  end
end
