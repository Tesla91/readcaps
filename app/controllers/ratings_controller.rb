class RatingsController < ApplicationController

  def avg_rating
    @recap = Recap.find(params[:recap_id])
  end

  def create
    @recap = Recap.find(params[:recap_id])
    @rating = Rating.new(rating_params)
    @rating.user = current_user
    @rating.recap = @recap

    if @rating.save
      redirect_to recap_path(@recap)
    else
      render 'recaps/show'
    end
  end

  private

  def rating_params
    params.require(:rating).permit(:comment, :star)
  end
end
