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
    if params[:order][:address_number] == 1
       # view で定義している address_number が"1"のときこの処理を実行
       # form_with で @order で送っているので、order に紐付いた address_number となる。以下同様
       @order.name = currenr_customer.post_code # @order　の各カラムに必要なもののを入れます
       @order.name = currenr_customer.address
       @order.name = currenr_customer.name
    elsif params[:order][:address_number] == "2"
       # view で定義している address_number が"2"のときこの処理を実行
    end
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

  def comprete
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
