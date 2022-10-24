class Public::CartItemsController < ApplicationController
  # before_action :authenticate_customer!

  def index
    @cart_items = current_customer.cart_items.all
    # @cart_item = CartItem.find_by(item_id: params[:cart_item])
    # @total_price=@cart_items.add_tax_price→viewで定義しているので不要
    @cart_item=CartItem.new
  end

  # カート内商品を追加・保存
  def create
    # @item = Item.find_by(params[:item_id])
    @cart_item = current_customer.cart_items.new(cart_item_params)
    # @cart_item.item_id = @item.id
     # もし元々カート内に「同じ商品」がある場合、「数量を追加」更新・保存する
      #ex.バナナ２個、バナナ２個ではなく　バナナ「4個」にしたい
    if current_customer.cart_items.find_by(item_id: params[:cart_item][:item_id]).present?
    #元々カート内にあるもの「item_id」
    #今追加した params[:cart_item][:item_id])
        cart_item=current_customer.cart_items.find_by(item_id: params[:cart_item][:item_id])
        cart_item.quantity+=params[:cart_item][:quantity].to_i
        # cart_item.quantityに今追加したparams[:cart_item][:quantity]を加える
         #.to_iとして数字として扱う
        cart_item.save
        redirect_to cart_items_path
    # もしカート内に「同じ」商品がない場合は通常の保存処理
    elsif @cart_item.save
          redirect_to cart_items_path
    else  # 保存できなかった場合
          @cart_items=current_customer.cart_items.all
          render 'index'
    end

    # if @cart_item.save
    #   @cart_item = CartItem.new
    #   redirect_to cart_items_path
    # else

    # end

  end

  def update

  end

  def destroy
    @cart_item=CartItem.find(params[:id]).destroy
    redirect_to request.referer
  end

  def destroy_all
    @cart_items=CartItem.all
    @cart_items.destroy_all
    redirect_to request.referer
  end

  private
  def cart_item_params
    params.require(:cart_item).permit(:item_id, :price, :quantity)
  end

end


