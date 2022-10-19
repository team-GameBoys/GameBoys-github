class Public::ItemsController < ApplicationController
  def index
    @item = Item.new
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
  end
  
    # 消費税を加えた商品価格
  def add_tax_price
      (self.price * 1.08).round
  end

end
