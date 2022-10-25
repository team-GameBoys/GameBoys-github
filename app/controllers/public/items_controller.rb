class Public::ItemsController < ApplicationController
 before_action :authenticate_customer!, except: [:index]
  def index
    @item = Item.new
    @items = Item.all
  end

  def show
    @cart_item = CartItem.new
    @item = Item.find(params[:id])
  end

  private
  def item_params
    params.require(:item).permit(:genre_id,:name,:introduction,:image,:price)
  end

end
