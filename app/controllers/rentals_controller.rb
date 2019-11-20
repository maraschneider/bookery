class RentalsController < ApplicationController
  def index
    @rentals = policy_scope(Rental)
  end

  def show
  end

  def create
    @rental = Rental.new(rental_params)
    @rental.user = current_user
    authorize @rental
    if @rental.save
      # TODO: redirect to rentals#show
      redirect_to current_user
    else
      render 'books/show'
    end
  end

  private

  def rental_params
    params.require(:rental).permit(:start_date, :return_date, :book_id)
  end
end
