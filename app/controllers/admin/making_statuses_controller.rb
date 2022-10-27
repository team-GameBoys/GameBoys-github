class Admin::MakingStatusesController < ApplicationController
 before_action :authenticate_admin!

  def update
    @order_item = OrderItem.find(params[:id])
    @order = @order_item.order
    @order_items = @order.order_items
     if @order_item.update(order_item_params)
      if @order_item.making_status == "c"
        @order.update(status: :production)
      elsif @order_items.all? {|order_item| order_item.making_status == "d" }
        @order.update(status: :preparing)
      end
       redirect_to request.referer
     end
  end

  private

  def order_item_params
   params.require(:order_item).permit(:making_status)
  end
end
