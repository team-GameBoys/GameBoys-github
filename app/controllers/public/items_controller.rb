class Public::ItemsController < ApplicationController

  def index
    @item = Item.new
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
  end
<<<<<<< HEAD

  private
  def item_params
    params.require(:item).permit(:genre_id,:name,:introduction,:image,:price)
    # スキーマにimageカラムを入れないといけないかもしれない
  end

=======
  
>>>>>>> origin/develop
end
