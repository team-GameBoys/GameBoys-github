class CartItem < ApplicationRecord
  belongs to :customer
  belongs to :item
end
