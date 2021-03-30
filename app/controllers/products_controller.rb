class ProductsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit]
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
    @product = Product.find(params[:id])
  end

  def edit
    @product = Product.find(params[:id])
    unless @product.user_id == current_user.id
      redirect_to action: :index
    end
  end

  def update
    @product = Product.find(params[:id])
    @product.update(product_params)
    if @product.update(product_params)
      redirect_to product_path(@product.id), method: :get
    else
      render :edit
    end
  end

  private

  def product_params
    params.require(:product).permit(:name, :category_id, :status_id, :delivery_fee_id, :perfecture_id, :delivery_days_id,
                                    :price, :description, :image).merge(user_id: current_user.id)
  end
end
