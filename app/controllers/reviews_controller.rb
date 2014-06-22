class ReviewsController < ApplicationController

  def index
    @reviews = Reviews.all
  end

  def new
   @restaurant = Restaurant.find(params[:id])
    @review = @restaurant.review.new
    # @review = Review.new(@restaurant)
    # @restaurant = Restaurant.find(params[:restaurant_id])
  end

  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new(review_params)
    @review.restaurant_id = @restaurant.id
    if @review.save
      flash[:notice] = "Success!"
      redirect_to @restaurant
    else
      flash.now[:notice] = "Your review couldn't be saved."
      render :new
    end
  end

  private

  def review_params
    params.require(:review).permit(:rating, :body, :resturant_id, )
  end
end
