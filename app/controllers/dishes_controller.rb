class DishesController < ApplicationController
  def show
    @dish = Dish.find(params[:id])
    @reviews = Review.where(dish_id: params[:id])
    @count = @reviews.count
  end

  def new
    @dish = Dish.new
  end

  def create
    # @dish = Dish.new(strong_dish_params)
    # @dish.user = current_user
    # if @dish.save
    #   redirect_to dish_path(@dish)
    # else
    #   render :new
    # end
  end

  def search
    if params[:address].present?
      @address = "near #{params[:address]}"
      filter_dishes = Dish.joins(:restaurant).near(@address, 20)
      # filter_dishes = filter_dishes.select
      @dishes = filter_dishes.to_a
    else
      @dishes = Dish.all
    end
    @count = @dishes.count
    @restaurants = @dishes.map { |dish| dish.restaurant }.uniq
    @markers = @restaurants.map do |restaurant|
      {
        lat: restaurant.latitude,
        lng: restaurant.longitude
      }
    end
  end

  private

  def strong_dish_params
    params.require(:dish).permit(:name, :photo, :price, :rating, :category, :restaurant_id, :user_id)
  end
end
