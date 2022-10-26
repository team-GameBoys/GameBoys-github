class Public::OrdersController < ApplicationController
   before_action :authenticate_customer!
  # 注文情報入力画面から作る郵便番号や宛名、住所を保存する
  def new
    @order = Order.new
  end

  # 購入確定
  # def create

  #   order.save
  #   redirect_to 'orders/complete'
  # end

  def confirm
    @order = Order.new(order_params)
    @total_payment = 0
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
    @total_payment = @cart_items.inject(0) { |sum, item| sum + item.subtotal }
  end

  # def create
  #   @orders = Order.all
  # end

  def show
    @order = Order.find(params[:id])
  end

  def create
    @order = Order.new(order_params)
    @order = current_customer.orders.new(order_params)
    @order.save
    current_customer.cart_items.each do |cart_item|
     @order_item = OrderItem.new
     @order_item.order_id = @order.id
     @order_item.item_id = cart_item.item_id
     @order_item.quantity = cart_item.quantity
     @order_item.price = cart_item.item.add_tax_price
     @order_item.save
    end
    current_customer.cart_items.destroy_all
    redirect_to complete_orders_path
  end

  def complete
  end

  def index
    @orders = current_customer.orders.all
  end

  private
  def order_params
   params.require(:order).permit(:payment_method, :post_code, :address, :name, :total_payment)
  end
end

