class Item < ApplicationRecord
  
  has_one_attached :image
  
  belongs_to :genre
  has_many :cart_items, dependent: :destroy
  has_many :order_items,dependent: :destroy
  
      # 消費税を加えた商品価格
    def add_tax_price
        (self.price * 1.1).round
    end

end
