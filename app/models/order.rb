class Order < ApplicationRecord
  has_one :buyer
  belongs_to :user
  belongs_to :product
end
