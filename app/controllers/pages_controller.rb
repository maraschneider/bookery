class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  def home
    @books = Book.all
    @book = Book.new(params[:id])
  end
end
