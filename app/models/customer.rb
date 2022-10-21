class Customer < ApplicationRecord

 devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

 #アソシエーションの記述
 has_many :cart_items, dependent: :destroy
 has_many :deliveries, dependent: :destroy
 has_many :orders, dependent: :destroy

end
