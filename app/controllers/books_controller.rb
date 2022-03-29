require "open-uri"
require "json"

class BooksController < ApplicationController
  skip_before_action :authenticate_user!, only: :index

  def index
    if params[:query].present?
      @books = Book.search_by_title_and_author(params[:query])
    else
      @books = Book.all
    end
  end

  def new
    @search = params[:query]
    if @search.present?
      @db_books = Book.search_by_title_and_author(params[:query])
      url = "https://www.googleapis.com/books/v1/volumes?q=#{@search}&projection=lite&orderBy=relevance&langRestrict=en&key=#{ENV['GOOGLE_API_KEY']}"
      user_serialized = URI.open(url).read
      user = JSON.parse(user_serialized)
      @api_books = user["items"][0..7]
    end
    @book = Book.new(params[:book])
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      redirect_to new_recap_path(book_id: @book.id)
    else
      render :new
    end
  end

  private

  def book_params
    params.require(:book).permit(:title, :author, :description, :photo_url)
  end
end
