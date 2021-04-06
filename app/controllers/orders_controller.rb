class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :product_find, only: [:index, :create]
  before_action :product_sold_out, only: [:index, :create]
  before_action :product_buying_myself, only: [:index, :create]

  def index
    @order_form = OrderForm.new
    

  end

  def create
    @order_form = OrderForm.new(order_params)
    if @order_form.valid?
      pay_product
      @order_form.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.require(:order_form).permit(:postal_code, :perfecture_id, :city, :numbering, :building_name, :telephone_number).merge(
      user_id: current_user.id, product_id: params[:product_id], token: params[:token]
    )
  end

  def pay_product
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @product.price, card: order_params[:token],
      currency: 'jpy'
    )
  end

  def product_find
    @product = Product.find(params[:product_id])
  end

  def product_sold_out
    redirect_to root_path if @product.order.present?
  end

  def product_buying_myself
    redirect_to root_path if @product.user_id == current_user.id
  end
end
