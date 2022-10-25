class Public::OrdersController < ApplicationController
  # 注文情報入力画面から作る郵便番号や宛名、住所を保存する
  def new
    @orders = Order.new
  end

  # 購入確定
  def create

    order.save
    redirect_to 'orders/complete'
  end

  def check
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
      # new/viewで作ったフォームを送る
   end
    @cart_items = current_customer.cart_items.all
  end

  def index
    @orders = Order.all

  def create
    @order = Order.new(order_params)
    @order = current_customer.orders.new(order_params)
    @order.save
    cart_items.each do |cart|
     @order_item = OrderItem.new
     @order_item.order_id = order.id
     @order_item.item_id = cart_item_id
     @order_item.order_name = cart_itemm.name
     @order_item.order_quantity = cart_items.quantity
     @order_item.order_price = cart_item.price
     @order_item.save
    end
    current_user.cart_items.destroy_all
  end

  def complete

  end

  def index
    @orders = current_customer.orders.all
  end

  private
  def order_params
   params.require(:order).permit(:payment_method, :post_code, :address, :name)
  end

  def show
    @order = Order.find(params[:id])
  end

 end
end
