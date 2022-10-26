class HomesController < ApplicationController
  def top
    @items = Item.limit(4)
  end
end
