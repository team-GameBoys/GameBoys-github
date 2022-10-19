class Admin::ItemsController < ApplicationController
  
  def index
    @items = Item.all
  end
  
  def new
    @item = Item.find(params[:id])
  end
  
  def created
  end
  
  def show 
  end
  
  def edit
  end
  
  def update
  end
  
end
