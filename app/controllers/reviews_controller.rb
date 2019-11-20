class ReviewsController < ApplicationController
  def new
   # @review = current_user.rentals.reviews.new
   # authorize @review
  end

  def create
  #  @review = current_user.rentals.reviews.new(review_params)
  #  authorize @review
  #  if @review.save
  #    redirect_to @review
  #  else
  #    render 'new'
  #  end
  end
end
