class BooksController < ApplicationController

  def index

  end

  def show
    @book = Book.find(params[:id])
    @rental = Rental.new()
    authorize @book

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