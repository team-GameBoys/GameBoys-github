class Public::GenreController < ApplicationController
  # ジャンル検索機能
  
  def show
    @genres = Genre.all
    @genre = Genre.find(params[:id])
  end

end
