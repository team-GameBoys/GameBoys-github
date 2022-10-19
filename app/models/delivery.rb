class Delivery < ApplicationRecord
  
　#アソシエーションの記述
  belongs_to :customer
end
