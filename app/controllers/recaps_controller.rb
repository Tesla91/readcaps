class RecapsController < ApplicationController
  def index
    @recaps = Recap.all
  end

  def show
    @recap = Recap.find(params[:id])
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

  private

  def recap_params
    params.require(:recap).permit(:summary, :user_id, :book_id)
  end
end
