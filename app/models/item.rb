class Item < ApplicationRecord
  
  has_one_attached :image
  
  belongs_to :genre
  has_many :cart_items, dependent: :destroy
  has_many :order_items,dependent: :destroy
  
    # 消費税を加えた商品価格
  def add_tax_price
      (self.price * 1.1).round
  end
  
    # もし写真を持っていなかったらunless、持ってたらその写真を表示
  def get_image(width, height)
     unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'no_image.jpg', content_type: 'image/jpg')
     end
      image.variant(resize_to_limit: [width, height]).processed
  end
  
  validates :quantity, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 0}

end
