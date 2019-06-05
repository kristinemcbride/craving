class DishesController < ApplicationController
  skip_before_action :authenticate_user!

  def show
    @dish = Dish.find(params[:id])
    @reviews = Review.where(dish_id: params[:id])
    @new_review = Review.new
    @count = @reviews.count
    if user_signed_in?
      if current_user.favorites.any? { |favorite| favorite.dish == @dish }
        @favorite = Favorite.where(dish_id: params[:id])
      else
        @favorite = Favorite.new()
      end
    end
  end

  def new
    @dish = Dish.new
  end

  def create
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
    @address = params[:address]
    @distance = params[:distance]&.to_i || 20
    @dish = params[:dish]
    @price = params[:price]
    @dishes = filter_dishes(@address, @distance, @dish, @price).to_a
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

  def map
    search
  end

  private

  def filter_dishes(address, distance, dish, price)
    if address.present?
      dishes = Dish.joins(:restaurant).order("rating DESC").near(address, distance)
    else
      dishes = Dish.joins(:restaurant).order("rating DESC").all
    end
    dishes = dishes.where("dishes.name @@ ?", "#{dish}") if dish.present?
    dishes = dishes.where("dishes.price <= ?", "#{price}") if price.present?
    dishes
  end

  def strong_dish_params
    params.require(:dish).permit(:name, :photo, :price, :rating, :category, :restaurant_id, :user_id)
  end
end

