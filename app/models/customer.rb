class Customer < ApplicationRecord

 #アソシエーションの記述
 has_many :cart_items
 has_many :deliveries
 has_many :orders
 
end
 