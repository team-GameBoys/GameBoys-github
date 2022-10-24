class Public::OrdersController < ApplicationController
  # 注文情報入力画面から作る郵便番号や宛名、住所を保存する
  # binding.pry
  def new
    @order = Order.new
  end

  def confirm
    @order = Order.new(order_params)
    # new 画面から渡ってきたデータを @order に入れる
   if params[:order][:select_address] == "1"
      # view で定義しているselect_address 1 を選択した場合
    @order.post_code = current_customer.post_code
    @order.address = current_customer.address
    @order.name = current_customer.first_name + current_customer.last_name
      # current_customerの住所を保存する
   elsif params[:order][:select_address] == "2"
      # view で定義しているselect_address 2 を選択した場合
    @deliveries = Delivery.find(params[:order][:delivery_id])
    @order.post_code = @deliveries.post_code
    @order.address = @deliveries.address
    @order.name = @deliveries.name
      # deliveriesの配送先住所を保存する
   elsif params[:order][:select_address] == "3"
      # view で定義しているselect_address 3 を選択した場合
    @order.post_code = params([:order][:post_code])
    @order.address = params([:order][:address])
    @order.name = params([:order][:name])
     # new/viewで作ったフォームから保存する
   end
    @cart_items = current_customer.cart_items.all
  end

  private
  def order_params
   params.require(:order).permit(:payment_method, :post_code, :address, :name)
  end

end
