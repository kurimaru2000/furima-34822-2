class Order < ApplicationRecord
  has_one :buyer
  # has_many :products
  belongs_to :product
end
