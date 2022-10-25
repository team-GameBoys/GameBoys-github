class Admin::HomesController < ApplicationController
  before_action :authenticate_admin!

def top
 @order_items = OrderItem.all
end



end
