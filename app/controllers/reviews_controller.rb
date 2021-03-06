class ReviewsController < ApplicationController

  def index
    @reviews = Reviews.all
  end

  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new
    @ratings = Rating.all
    # @review = Review.new(@restaurant)
    # @restaurant = Restaurant.find(params[:restaurant_id])
  end

  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new(review_params)
    value = Rating.find(@review.rating).value
    @review.review_value = value
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
    params.require(:review).permit(:rating, :body, :resturant_id, :value )
  end
end
