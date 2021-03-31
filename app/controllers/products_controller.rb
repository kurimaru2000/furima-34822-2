class ProductsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :destroy, :update]
  before_action :product_find, only:[:show, :edit, :update]
  def index
    @products = Product.includes(:user).order('created_at DESC')
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
    unless @product.user_id == current_user.id
      redirect_index
    end
  end

  def update
    redirect_to action: :indec unless @product.user_id == current_user.id
      if @product.update(product_params)
        redirect_index
      else
        render :edit
      end 
  end

  def destroy
    product = Product.find(params[:id])
    unless product.user_id == current_user.id
        redirect_index
    else
        product.destroy
        redirect_index
    end
  end

  private
  def product_params
    params.require(:product).permit(:name, :category_id, :status_id, :delivery_fee_id, :perfecture_id, :delivery_days_id,
                                    :price, :description, :image).merge(user_id: current_user.id)
  end

  def product_find
    @product = Product.find(params[:id])
  end
  
  def redirect_index
    redirect_to action: :index
  end


end
