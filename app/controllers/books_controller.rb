class BooksController < ApplicationController
  def index
  end

  def show
    @book = Book.find(params[:id])
    @rental = Rental.new
  end

  def search
    if params[:title].present?
      @title = params[:title]
      @books = Book.where("title ILIKE ?", "%#{@title}%")
    end
  end

  def show_selection

  end

  def new

  end

  def create

  end

  def edit

  end

  def update

  end

  def destroy

  end

end
