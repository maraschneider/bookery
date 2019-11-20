class RentalsController < ApplicationController
  def index
    @rentals = policy_scope(Rental)
    @books = current_user.books
    @rentals_host = []
    @books.each do |book|
      book.rentals.each do |rental|
        @rentals_host << rental
      end
    end
  end

  def show
  end

  def create
    @rental = Rental.new(rental_params)
    @rental.user = current_user

    authorize @rental
    if @rental.save
      redirect_to rentals_path
      flash[:notice] = "Rental of #{@rental.book.title} requested. The host has to confirm the rental."
    else
      render 'books/show'
    end
  end

  def edit
    @rental = Rental.find(params[:id])
    authorize @rental
  end

  def update
    @rental = Rental.find(params[:id])
    authorize @rental
    @rental.update(rental_params)
    if @rental.save
      redirect_to rentals_path
    else
      render :edit
    end
  end

  private

  def rental_params
    params.require(:rental).permit(:start_date, :return_date, :book_id, :status)
  end
end
