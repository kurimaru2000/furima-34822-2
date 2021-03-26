class Product < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :perfecture
  belongs_to :deliveryday
  belongs_to :deliveryfee
  belongs_to :user
  has_one_attached :image

   with_options presence: true do
    validates :name
    validates :category_id, numericality: { other_than: 1 } 
    validates :status_id, numericality: { other_than: 1 } 
    validates :delivery_fee_id, numericality: { other_than: 1 } 
    validates :perfecture_id, numericality: { other_than: 1 } 
    validates :delivery_days_id, numericality: { other_than: 1 } 
    validates :price, format: { with: /\A[0-9]+\z/ }, numericality: { greater_than:299, less_than:10000000 }
    validates :description
    validates :image
  end
end  
