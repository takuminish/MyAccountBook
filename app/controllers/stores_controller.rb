class StoresController < ApplicationController
  
  def index

    @stores = Store.all

  end
  def new

    @store = Store.new

  end

  def create
    
    @store= Store.new(store_params)
    if @store.save
      redirect_to stores_url

    else
      puts @store.errors.full_messages
      render :edit
    end

  end

  def edit

    @store = Store.find(params[:id])
  
  end

  def update
    @store = Store.find(params[:id])
    @store.update(store_params)
    if @store.save
      redirect_to stores_url

    else
      puts @store.errors.full_messages
      render :edit
    end
  end

  private def store_params

    params.require(:store).permit(:name)

  end
end
