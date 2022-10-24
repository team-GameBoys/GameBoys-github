class Admin::ItemsController < ApplicationController
  # Adminアカウントがログインしないと使えないようにする
  # before_action :authenticate_admin!

  def show
    @item = Item.find(params[:id])
    @genre = @item.genre
    # @item = Item.new
  end


  def edit
    @item = Item.find(params[:id])
    @genre_all = Genre.all
  end

  def index
    @item = Item.new
    @items = Item.all
  end

  def new
    # @item = current_admin.items.build
    @item = Item.new
    # @item.build_image
  end

  def create
    # わからん
    # @item = current_admin.items.build(item_params)
    @item =Item.new(item_params)
    if @item.save
      redirect_to admin_items_path, notice: "itemが正常に作成されました"
      # とりあえずインデックスに飛ばす。本当は、商品詳細に飛ばしたい。
    else
      @items = Item.all
      render 'new', notice: "itemの作成に失敗しました"
    end
  end



  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to admin_item_path(@item)
    else
      render 'edit'
    end
  end

  private
    def item_params
      params.require(:item).permit(:genre_id,:name,:introduction,:image,:price,:is_active)
    end


end
