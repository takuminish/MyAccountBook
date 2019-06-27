class ProductController < ApplicationController

    def destroy
        @product = Product.find(params[:id])
        @product.destory
    end

end
