class CartItem < ApplicationRecord
  belongs_to :customer
  belongs_to :item


  def subtotal
    item.add_tax_price*quantity
  end

  def add_tax_price
      (self.price * 1.1).round
  end

  def delivery_display
   '〒' + post_code + ' ' + address + ' ' + name
  end


end
