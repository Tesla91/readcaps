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
    @book = Book.new
    @search = params[:query]
    if @search.present?
      url = "https://www.googleapis.com/books/v1/volumes?q=#{@search}&projection=lite&orderBy=relevance&langRestrict=en&key=#{ENV['GOOGLE_API_KEY']}"
      user_serialized = URI.open(url).read
      user = JSON.parse(user_serialized)
      @books = user["items"][0..4]
    end
  end

  def create
    @book = Book.new
    @book.save
    redirect_to new_recap_path
  end
end
