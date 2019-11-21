class RentalsController < ApplicationController
  before_action :set_user, only: [:edit, :update]

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

  end

  def update
    @rental.update(rental_params)
    if @rental.save
      redirect_to rentals_path
    else
      render :edit
    end
  end

  private

  def set_user
    @rental = Rental.find(params[:id])
    authorize @rental
  end

  def rental_params
    params.require(:rental).permit(:start_date, :return_date, :book_id, :status)
  end
end
