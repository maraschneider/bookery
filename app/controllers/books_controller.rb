class BooksController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show, :search]
  before_action :set_book, only: [:show, :edit, :update, :destroy]

  def index
    @books = policy_scope(Book)
  end

  def show
    if current_user
      @rental = current_user.rentals.new
      @rental.book = @book
      @user = current_user
    end
  end

  def search
    if params[:title].present?
      @title = params[:title]
      @books = Book.where("title ILIKE ?", "%#{@title}%")
      authorize @books
    end
  end

  def show_selection
  end

  def new
    @book = current_user.books.new
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
    @book.update(book_params)
    if @book.save
      redirect_to @book
    else
      render 'edit'
    end
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
    params.require(:book).permit(:title, :year, :location, :language, :image_url, :author, :genre, :description)
  end
end
