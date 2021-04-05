class ProductsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :destroy, :update]
  before_action :product_find, only: [:show, :edit, :update, :destroy]
  before_action :move_to_index, only: [:edit, :update, :destroy]
  before_action :product_sold_out, only: [:edit, :update, :destroy]
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
    @order = Product.find(params[:id])
  end

  def edit
  end

  def update
    if @product.update(product_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    @product.destroy
    redirect_to root_path
  end

  private

  def product_params
    params.require(:product).permit(:name, :category_id, :status_id, :delivery_fee_id, :perfecture_id, :delivery_days_id,
                                    :price, :description, :image).merge(user_id: current_user.id)
  end

  def product_find
    @product = Product.find(params[:id])
  end

  def move_to_index
    redirect_to root_path unless @product.user_id == current_user.id
  end

  def product_sold_out
    redirect_to root_path if @product.orders.present?
  end
  end


