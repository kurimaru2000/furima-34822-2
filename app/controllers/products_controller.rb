class ProductsController < ApplicationController
  before_action :move_to_sign_in, except: [:index, :show, :search]


  def index
    # @product = Product.all
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

  private
  def product_params
    params.require(:product).permit(:name, :category_id, :status_id, :delivery_fee_id, :perfecture_id, :delivery_days_id, :price, :description, :image).merge(user_id: current_user.id)
  end         
  
  def move_to_sign_in
    unless user_signed_in?
      # ログインしているかどうかを判定するメソッド
      redirect_to :new_user_session
      # 別の画面に変遷させる行
      # あんれすはいふと逆の動きでfailesを返した時に該当のアクションをする。
    end
  end





end
