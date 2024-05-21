class ProductsController < ApplicationController
  before_action :authenticate_user!, only:[:new,:create, :edit, :update]
  before_action :find_product, only:[:show, :edit, :update, :destroy]

  def index

    @products = Product.all.order(created_at: :desc)

  end

  def new
    @product=Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
  end

  def edit
    if current_user.id != @product.user_id
      redirect_to root_path
    end
  end

  def update 
    if @product.update(product_params)
      redirect_to product_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if current_user.id == @product.user_id
      @product.destroy
      redirect_to root_path
    end
  end


  private

  def find_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:product_name, :description, :category_id, :condition_id, :shipping_cost_id, :shipping_area_id, :shipping_day_id, :price, :image).merge(user_id: current_user.id)
  end

end
