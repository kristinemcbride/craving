class RestaurantDishFormsController < ApplicationController
  def new
    @restaurant_dish_form = RestaurantDishForm.new
  end

  def create
    @restaurant_dish_form = RestaurantDishForm.new(restaurant_dish_form_params)
    if @restaurant_dish_form.save
      redirect_to dish_path(@restaurant_dish_form.dish)
    else
      render :new
    end
  end

  private

  def restaurant_dish_form_params
    params.require(:restaurant_dish_form).permit(:restaurant_name, :dish_name, :restaurant_address, :dish_photo, :dish_price, :dish_category, :dish_photo_cache, :dish_rating).merge({user_id: current_user.id})
  end
end
