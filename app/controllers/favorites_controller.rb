class FavoritesController < ApplicationController
  def new
    @favorite = Favorite.new
  end

  def create
    @favorite = Favorite.new
    @recap = Recap.find(params[:recap_id])
    @favorite.recap = @recap
    @favorite.user = current_user

    @favorite.save
    redirect_to dashboard_index_path, notice: 'Recap was successfully added to your library'
  end
end
