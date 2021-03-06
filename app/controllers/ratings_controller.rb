class RatingsController < ApplicationController
  def create
    @recap = Recap.find(params[:recap_id])
    @rating = Rating.new(rating_params)
    @rating.user = current_user
    @rating.recap = @recap

    if @rating.save
      redirect_to recap_path(@recap, anchor: "rating-#{@rating.id}")
    else
      @favorite = Favorite.new
      render 'recaps/show'
    end
  end

  def destroy
    @rating = Rating.find(params[:id])
    @rating.destroy

    redirect_to recap_path(@rating.recap, anchor: "anchor-review")
  end

  def update
    @rating = Rating.find(params[:id])
    @rating.update(params[:rating_params])

    if @rating.update(params[:rating_params])
      redirect_to recap_path(@recap, anchor: "rating-#{@rating.id}")
    else
      render 'recaps/show'
    end
  end

  private

  def rating_params
    params.require(:rating).permit(:comment, :star)
  end
end
