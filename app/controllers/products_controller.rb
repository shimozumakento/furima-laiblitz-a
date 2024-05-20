class ProductsController < ApplicationController
  before_action :authenticate_user!, only:[:new,:create]
  def index
  end

  def new
    @product=Product.new
  end

  def create
    @product = Product.new(product_params)
    @product.user_id = current_user.id
    if @product.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private
  def product_params
    params.require(:product).permit(:user_id, :product_name, :description, :category_id, :condition_id, :shipping_cost_id, :shipping_area_id, :shipping_day_id, :price, :image)
  end
  
end
