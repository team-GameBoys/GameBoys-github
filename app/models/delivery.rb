class Delivery < ApplicationRecord
  
  #アソシエーションの記述
  belongs_to :customer
  
  def delivery_display
   '〒' + post_code + ' ' + address + ' ' + name
  end
  
end
