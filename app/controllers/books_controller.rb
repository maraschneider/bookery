class BooksController < ApplicationController
  before_action :set_book, only: [:show, :edit, :update, :destroy]
  def index
    @books = policy_scope(Book)
  end

  def show
    @rental = Rental.new()

  end

  def show_selection

  end

  def new
    @book = current_user.books.new()
    authorize @book
  end

  def create
    @book = current_user.books.new(book_params)
    authorize @book
    if @book.save
      redirect_to @book
    else
      render 'new'
    end
  end

  def edit

  end

  def update

  end

  def destroy
    @book.destroy
  end

  private

  def set_book
    @book = Book.find(params[:id])
    authorize @book
  end

  def book_params
    params.require(:book).permit(:title, :year, :location, :language, :image_url, :author, :genre)
  end

end
