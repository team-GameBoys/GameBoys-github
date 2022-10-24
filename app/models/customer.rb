class Customer < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

 #アソシエーションの記述
 has_many :cart_items, dependent: :destroy
 has_many :deliveries, dependent: :destroy
 has_many :orders, dependent: :destroy
end

# is_deletedがfalseならtrueを返すようにしている
  def active_for_authentication?
    super && (is_deleted == false)
  end
