class Public::OrdersController < ApplicationController
  # 注文情報入力画面から作る郵便番号や宛名、住所を保存する
  # binding.pry

  def confirm
    @order = Order.new
   if params[:order][:select_address] == "1"
     @order.post_code = current_customer.post_code
     @order.address = current_customer.address
     @order.name = current_customer.first_name + current_customer.last_name
   elsif params[:order][:select_address] == "2"
     @deliveries = Deliveries.find(params[:order][:deliveries_id])
     @order.post_code = @deliveries.post_code
     @order.address = @deliveries.address
     @order.name = @deliveries.name
   elsif params[:order][:select_address] == "3"
     @order.post_code = params([:order][:post_code]
     @order.address = params([:order][:address])
     @order.name = params([:order][:name])
   end
  end

  private

  def order_params
   params.require(:order).permit(:payment_method, :post_code, :address, :name)
  end
end
