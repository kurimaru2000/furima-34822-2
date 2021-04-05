class OrderForm
  # 配送先と購入履歴の情報を同時に保存するファイル
  include ActiveModel::Model
  attr_accessor :postal_code, :perfecture_id, :city, :numbering, :building_name, :telephone_number, :product_id, :user_id,
                :order_id, :token

  # ここにバリデーションの処理を書く
  with_options presence: true do
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/ }
    validates :perfecture_id, numericality: { other_than: 1 }
    validates :city
    validates :numbering
    validates :telephone_number, length: { maximum: 11 }
    validates :user_id
    validates :product_id
    validates :token
  end

  def save
    order = Order.create(product_id: product_id, user_id: user_id)

    Buyer.create(postal_code: postal_code, perfecture_id: perfecture_id, city: city, numbering: numbering,
                 building_name: building_name, telephone_number: telephone_number, order_id: order.id)
  end
end
