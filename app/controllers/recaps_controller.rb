class RecapsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show all_recaps]

  def index
    @recaps = Recap.all
    @book = Book.find(params[:book_id])
  end

  def show
    @recap = Recap.find(params[:id])
    @rating = Rating.new
    @favorite = Favorite.new
  end

  def new
    if params[:book_id].present?
      @book_id = params[:book_id]
    end
    @recap = Recap.new(params[:recap])
  end

  def create
    if Book.find(params[:recap][:book_id])
      @book = Book.find(params[:recap][:book_id])
    end
    @recap = Recap.new(recap_params)
    if current_user&.already_recapped?(@book)
      flash.now[:alert] = "You have already recaped this book"
      render :new
    else
      @recap.user = current_user
    end

    if @recap.save
      redirect_to recap_path(@recap), notice: 'Recap was successfully created'
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
      @recaps = recaps_all.select { |recap| recap.avg_rating > 3 }
    else
      @recaps = Recap.all.order('title ASC')
    end
  end

  private

  def recap_params
    params.require(:recap).permit(:summary, :title, :user_id, :book_id, :keypoint)
  end
end
