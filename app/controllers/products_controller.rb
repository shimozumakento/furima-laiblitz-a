class ProductsController < ApplicationController
  def index
  end

  def new
    @Product=Product.new
  end

  def create
    @Product = Product.new(product_params)
    if @Product.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private
  def product_params
    params.require(:product).permit(:user, :product_name, :description, :category_id, :condition_id, :shipping_cost_id, :shipping_area_id, :shipping_day_id, :price)
  end
  
end
