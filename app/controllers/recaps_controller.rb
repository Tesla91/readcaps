class RecapsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show new all_recaps]

  def index
    @recaps = Recap.all
    @book = Book.find(params[:book_id])
  end

  def show
    @recap = Recap.find(params[:id])
    @rating = Rating.new
  end

  def new
    @recap = Recap.new
    # @book = Book.find(params[:book_id])
  end

  def create
    # Check if book id Params exist take these as book id, else take
    if Book.find(params[:book_id])
      @book = Book.find(params[:book_id])

    else
      @book = Book.find(params[:recap][:book_id])
    end
    @recap = Recap.new(recap_params)
    @recap.user = current_user
    if @recap.save
      redirect_to recaps_path(@recap), notice: 'Recap was successfully created'
    else
      render :new
    end
  end

  def edit
    @recap = Recap.find(params[:id])
  end

  def update
    @recap = Recap.find(params[:id])
    @recap.update(recap_params)
    redirect_to recap_path(@recap)
  end

  def destroy
    @recap = Recap.find(params[:id])
    @recap.destroy

    redirect_to root_path
  end

  def all_recaps
    if params[:top] == "yes"
      recaps_all = Recap.all
      @recaps = recaps_all.map { |recap| recap if recap.ratings.average("star") > 3 }.compact
    else
      @recaps = Recap.all.order('title ASC')
    end
  end

  private

  def recap_params
    params.require(:recap).permit(:summary, :title, :user_id, :book_id)
  end
end
