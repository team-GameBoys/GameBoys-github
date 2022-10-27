class Admin::OrdersController < ApplicationController


  def show
    @order = Order.find(params[:id])
    @order_item = OrderItem.find(params[:id])
  end

  def update
    @order = Order.find(params[:id])
    @order_items = @order.order_items
     if @order.update(order_params)
      if @order.status == "confirmation"
       @order_items.update_all(making_status: :b)
      end
       redirect_to request.referer
     end
  end

  private

   def order_params
     params.require(:order).permit(:status)
   end
end
