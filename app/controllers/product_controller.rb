class ProductController < ApplicationController

    def destory
        @product = Product.find(params[:id])
        @product.destory
    end

end
