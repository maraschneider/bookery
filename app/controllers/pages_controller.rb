class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  def home
    @books = Book.all.order(id: :asc)
    @book = Book.new
  end
end
