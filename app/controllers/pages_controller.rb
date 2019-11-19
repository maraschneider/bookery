class PagesController < ApplicationController
  def home
    @books = Book.new(params[:id])
  end
end
