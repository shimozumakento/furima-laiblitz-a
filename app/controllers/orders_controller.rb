class OrdersController < ApplicationController
  before_action :authenticate_user!, only:[:index,:create]
  before_action :redirect_unsold_to_top, only: [:index]
  before_action :redirect_sold_to_top, only: [:index]
  before_action :loading_product, only: [:index, :create,]


  def index
    gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
    @history_address = HistoryAddress.new
    @product = loading_product
  end

  def new
  end

  def create
  @history_address = HistoryAddress.new(history_params)
  @product = loading_product
  if @history_address.valid?
    @history_address.save
    if pay_item
      redirect_to root_path
    else
      gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
      render :index, status: :unprocessable_entity
    end
  else 
    render :index, status: :unprocessable_entity
  end

end


  private

  def loading_product
    Product.find(params[:product_id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
     amount: @product.price,
     card: params[:token],
     currency: 'jpy'
    )
  end


  def redirect_unsold_to_top
    product = loading_product
    if product.user != current_user && History.exists?(product_id: product.id)
      redirect_to root_path
    end
  end

  def redirect_sold_to_top
    product = loading_product
    if current_user
      if product.user == current_user
        redirect_to root_path
      end
    end
  end
  


  def history_params
    params.require(:history_address).permit(:postal_code, :shipping_area_id, :city, :street_address, :building_name, :phone_number, :user_id, :product_id).merge(token: params[:token])
  end
end
