class HomesController < ApplicationController
  def top
    @items = Item.limit(4)
     @item = Item.new
    # presentでparams[:genre_id]があった場合、Genre.find(params[:genre_id])なかったら、（デフォルト）でItem.all
    # @items = params[:name ].present? ? Genre.find(params[:name]).items : Item.all
    @genres = Genre.all
    # 1,2,3,4,‥‥が返ってきたらtrue側、0,空nilの時は、else
    if params[:genre_id]
      # 原則モデル名は大文字、カラムは小文字でいい
      @genre = Genre.find(params[:genre_id])
      # findはIDだけでデータを探す、find_by　ID以外でも、カラムの条件でも探す例えばfind_by(item_id: params[:cart_item][:item_id])左側に.　 where
      @genre_name = @genre.name
      # そのジャンルのアイテム
      @genre_items = @genre.items
    else
      @genre_name = nil
      @items = Item.all

    end
  end
end
