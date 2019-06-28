class StorePurchaseControllerController < ApplicationController

    def destroy
        @store_purchase = StorePurchase.find(params[:id])
        @store_purchase.destroy
        redirect_back(fallback_location: stores_path)
    end
end
