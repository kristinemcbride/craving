class DishesController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :filter_dishes, only: [:search, :map]
  def show
    @dish = Dish.find(params[:id])
    @reviews = Review.where(dish_id: params[:id])
    @new_review = Review.new
    @count = @reviews.count
    if current_user.favorites.any? { |favorite| favorite.dish == @dish }
      @favorite = Favorite.where(dish_id: params[:id])
    else
      @favorite = Favorite.new()
    end
  end

  def new
    @dish = Dish.new
    @restaurant = Restaurant.where(name: "La Real Hamburguesería")
  end

  def create
    raise
    @restaurant = Restaurant.where(name: params[])
    @dish = Dish.new(strong_dish_params)
    @dish.user = current_user
    current_user.favorites << @dish
    if @dish.save
      redirect_to dish_path(@dish)
    else
      render :new
    end
  end

  def search
  end

  def map
  end

  private

  def filter_dishes
     if params[:address].present?
      @address = params[:address]
      filter_dishes = Dish.joins(:restaurant).order("rating DESC").near(@address, 20)
      filter_dishes = filter_dishes.where("dishes.name ILIKE ?", "%#{params[:dish]}%") if params[:dish].present?
    else
      filter_dishes = Dish.order("rating DESC").all
      filter_dishes = filter_dishes.where("dishes.name ILIKE ?", "%#{params[:dish]}%") if params[:dish].present?
    end
    @dishes = filter_dishes.to_a
    @count = @dishes.count
    @restaurants = @dishes.map { |dish| dish.restaurant }.uniq
    @user_location = [request.location.latitude, request.location.longitude]

    @markers = @restaurants.map do |restaurant|
      {
        lat: restaurant.latitude,
        lng: restaurant.longitude,
        infoWindow: render_to_string(partial: "infowindow", locals: { restaurant: restaurant }),
        image_url: helpers.asset_url('cravingpin.png')
      }
    end

  end

  def strong_dish_params
    params.require(:dish).permit(:name, :photo, :price, :rating, :category, :restaurant_id, :user_id)
  end
end
