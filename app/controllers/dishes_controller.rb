class DishesController < ApplicationController
  before_action :set_restaurant, only: [:search]

  def show
    @dish = Dish.find(params[:id])
  end

  def new
    @dish = Dish.new
  end

  def create
    @dish = Dish.new(strong_dish_params)
    @dish.user = current_user
    if @dish.save
      redirect_to dish_path(@dish)
    else
      render :new
    end
  end

  def search
   raise
    @dish.restaurant = @restaurant
    @results = Dish.where("address = ?", params[:address])
  end

  private

  def set_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  def strong_dish_params
    params.require(:dish).permit(:name, :photo, :price, :rating, :category, :restaurant_id, :user_id)
  end
end
