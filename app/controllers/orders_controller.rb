class OrdersController < ApplicationController
  def index
    @history_address = HistoryAddress.new
    @product = Product.find(params[:product_id])
  end

  def new
  end

  def create
  @product = Product.find(params[:product_id])
  @history_address = HistoryAddress.new(history_params)
  
  if @history_address.valid?
    @history_address.save
    if pay_item
      redirect_to root_path
    else
      render :index, status: :unprocessable_entity
    end
  else 
    render :index, status: :unprocessable_entity
  end

end


  private

  def pay_item
    Payjp.api_key = "sk_test_9ce792f31294b41c42f54fc6"
    Payjp::Charge.create(
     amount: @product.price,
     card: params[:token],
     currency: 'jpy'
    )
  end



  def history_params
    params.require(:history_address).permit(:postal_code, :shipping_area_id, :city, :street_address, :building_name, :phone_number, :user_id, :product_id)
  end
end
