class DishesController < ApplicationController

  def show
    @dish = Dish.find(params[:id])
    @reviews = Review.find_by(dish_id: params[:id])
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
    @results = Dish.joins(:restaurant).where("restaurants.address = ?", params[:address])
  end

  private

  def strong_dish_params
    params.require(:dish).permit(:name, :photo, :price, :rating, :category, :restaurant_id, :user_id)
  end
end
