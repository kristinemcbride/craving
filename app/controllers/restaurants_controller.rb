class RestaurantsController < ApplicationController
  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(strong_restaurant_params)
    if @restaurant.save
      redirect_to dish_path(@dish)
    else
      render :new
    end
  end

  def show
    @restaurant = Restaurant.find(params[:id])
    @dishes = @restaurant.dishes
    @restaurant.average_rating = restaurant_rating
  end

  private

  def restaurant_rating
    counter = 0
    total_rating = 0
    @restaurant.dishes.each do |dish|
      rating = dish.rating
      total_rating += rating
      counter += 1
    end
    return total_rating / counter
  end

  def strong_restaurant_params
    params.require(:restaurant).permit(:name, :address, :average_rating, :price_range, :delivery_url, :booking_url, :longitude, :latitude, :photo)
  end
end
