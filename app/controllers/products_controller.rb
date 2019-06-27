class ProductsController < ApplicationController

    def destroy
        @product = Product.find(params[:id])
        @product.destroy
        redirect_back(fallback_location: stores_path)
    end

end
