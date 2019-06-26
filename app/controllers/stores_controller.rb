class StoresController < ApplicationController
  
  def index

    @stores = Store.all

  end
  def new

    @store = Store.new

  end

  def create
    
    @store= Store.new(store_params)
    @store.save

  end

  private def store_params

    params.require(:store).permit(:name)

  end
end
