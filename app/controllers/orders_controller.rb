class OrdersController < ApplicationController
  def index
    @history_address = HistoryAddress.new
    @product = Product.find(params[:product_id])
  end

  def new
  end

  def create
    @product = Product.find(params[:product_id])
    @history = History.new(user_id: current_user.id, product_id: @product.id)

    if @history.save
      @address=Address.new(history_params)
      if @address.save
        redirect_to root_path
      end
    end
  end
    
  

  private
  def history_params
    params.require(:history_address).permit(:postal_code, :shipping_area_id, :city, :street_address, :building_name, :phone_number).merge(history_id: @history.id)
  end
  
end



