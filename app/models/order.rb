class Order < ApplicationRecord
  belongs_to :customer
  has_many :orders_items, dependent: :destroy
end
