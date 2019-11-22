class BooksController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show, :index]
  before_action :set_book, only: [:show, :edit, :update, :destroy]

  def index

    @books = policy_scope(Book)
    if params[:query].present?
      @books = Book.search_by_title_author_year_language_genre(params[:query])
    else
      @books = Book.all
    end

    # users_from_search = []

    # @books.each do |book|
    #   users_from_search << User.find(book.user_id)
    # end

    if current_user
      @markers = User.all.near(current_user.location, 20).map do |user|
        {
          lat: user.latitude,
          lng: user.longitude,
          infoWindow: render_to_string(partial: "info_window", locals: { user: user }),
          image_url: helpers.asset_url('book_pin.png')
        }
      end
    else
      unloged_user_location = 'Rudi-Dutschke-Straße 26, 10969 Berlin'
      @markers = User.near(unloged_user_location, 10).map do |user|
        {
          lat: user.latitude,
          lng: user.longitude,
          infoWindow: render_to_string(partial: "info_window", locals: { user: user }),
          image_url: helpers.asset_url('book_pin.png')
        }
      end
    end
    # raise
  end

  def show
    if current_user
      @rental = current_user.rentals.new
      @rental.book = @book
      @user = current_user
    end
  end

  #currently not in use:
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

  #currently not in use:
  def search_by_title_strict(query_string)
    Book.where(title: params[:query])
  end

  def set_book
    @book = Book.find(params[:id])
    authorize @book
  end

  def book_params
    params.require(:book).permit(:title, :year, :location, :language, :book_cover, :author, :genre, :description)
  end

  def disable_dates_for_rental
    @book.rentals.all.each do |rental|
      dates_array << {
        from: rental.start_date,
        to: rental.return_date
      }
    end
    dates_array
  end
end
