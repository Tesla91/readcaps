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
    @recap = Recap.new(recap_params)
    @book = Book.find(params[:book_id])
    @recap.book = @book
    @recap.user = current_user
    if @recap.save
      redirect_to book_path(@book[:book_id]), notice: 'recap was successfully created'
    else
      render :new
    end
  end

  private

  def recap_params
    params.require(:recap).permit(:summary, :user_id, :book_id)
  end
end
