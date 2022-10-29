class CartItem < ApplicationRecord
  belongs_to :customer
  belongs_to :item

  # def sum_of_price
  #   item.price*quantity
  # end

  def add_tax_price
      (self.price * 1.1).round
  end

  def subtotal
    item.add_tax_price*quantity
  end
  
end
