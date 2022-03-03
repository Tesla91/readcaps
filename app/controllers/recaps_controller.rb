class RecapsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show new all_recaps]

  def index
    @recaps = Recap.all
  end

  def show
    @recap = Recap.find(params[:id])
    @rating = Rating.new
  end

  def new
    @recap = Recap.new
    @book = Book.find(params[:book_id])
  end

  def create
    @book = Book.find(params[:book_id])
    @recap = Recap.new(recap_params)
    @recap.book = @book
    @recap.user = current_user
    if @recap.save
      redirect_to book_recaps_path(@book), notice: 'recap was successfully created'
    else
      render :new
    end
  end

  def all_recaps
    if params[:top] == "yes"
      recaps_all = Recap.all
      @recaps = recaps_all.map { |recap| recap if recap.ratings.average("star") > 3 }.compact.order('title ASC')
    else
      @recaps = Recap.all.order('title ASC')
    end
  end

  private

  def recap_params
    params.require(:recap).permit(:summary, :user_id, :book_id)
  end
end
