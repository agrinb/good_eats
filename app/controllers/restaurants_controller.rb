class RestaurantsController < ApplicationController

  def index

    @restaurants = Restaurant.paginate(:page => params[:page], :per_page => 10)
  end

  def new
    binding.pry
    @restaurant = Restaurant.new

  end

  def show
    @restaurant = Restaurant.find(params[:id])
  end

    def create
    @restaurant = Restaurant.new(restaurant_params)

    if @restaurant.save
      flash[:notice] = "Success!"
      redirect_to '/restaurants'
    else
      flash.now[:notice] = "Your restaurant couldn't be saved."
      render :new
    end
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :city, :state, :zipcode, reviews_attributes: [:rating, :body, :id])
  end
end
