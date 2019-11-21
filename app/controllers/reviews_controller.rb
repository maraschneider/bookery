class ReviewsController < ApplicationController
  def new
    @review = Review.new
   # @review = current_user.rentals.reviews.new
   authorize @review
  end

  def create
    @review = Review.new(review_params)
  #  @review = current_user.rentals.reviews.new(review_params)
  authorize @review
    if @review.save
      redirect_to @review
    else
      render 'new'
    end
  end

  private

  def review_params
    params.require(:review).permit(:rating, :content)
  end
end
