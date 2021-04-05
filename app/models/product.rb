class Product < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :perfecture
  belongs_to :delivery_days
  belongs_to :delivery_fee
  belongs_to :user
  has_one    :order
  has_one_attached :image

  with_options presence: true do
    validates :name
    validates :price, format: { with: /\A[0-9]+\z/ }, numericality: { greater_than: 299, less_than: 10_000_000 }
    validates :description
    validates :image
  end
  with_options presence: true, numericality: { other_than: 1 } do
    validates :category_id
    validates :status_id
    validates :delivery_fee_id
    validates :perfecture_id
    validates :delivery_days_id
  end
end
