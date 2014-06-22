class ReviewsController < ApplicationController

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)

    if @review.save
      flash[:notice] = "Success!"
      redirect_to '/reviews'
    else
      flash.now[:notice] = "Your review couldn't be saved."
      render :new
    end
  end

  private

  def review_params
    params.require(:review).permit(:rating, :body)
  end
end
