class Public::OrdersController < ApplicationController
  
  def new 
    @orders = Orders.new
  end
  
  def create
    @order = Order.new(order_params)
    @order.save
    redirect_to 'orders/complete'
  end
  
  def index
    @orders = Order.all
  end
  
  def show
    @order = Order.find(params[:id])
  end
  
end
