class DishesController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :filter_dishes, only: [:search, :map]

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
  end

  def map
  end

  private

  # def filter_by_price
  #   if params[:query].present?
  #     @dishes = SearchProducts.new(params: params[:query]).call
  #   else
  #     @dishes = Product.all
  #   end

  #   @dishes = Dish.joins(:restaurant).all
  #   @dishes = @dishes.to_a
  #   @count = @dishes.count
  #   @restaurants = @dishes.map { |dish| dish.restaurant }.uniq
  #   @user_location = [request.location.latitude, request.location.longitude]

  #   @markers = @restaurants.map do |restaurant|
  #     {
  #       lat: restaurant.latitude,
  #       lng: restaurant.longitude,
  #       infoWindow: render_to_string(partial: "infowindow", locals: { restaurant: restaurant }),
  #       image_url: helpers.asset_url('cravingpin.png')
  #     }
  #   end
  # end

  def filter_dishes
    @address = params[:address]
    @dish = params[:dish]
    @price = params[:price]
    @distance = params[:distance]

    @dishes = Dish.joins(:restaurant).order("rating DESC").all
    @dishes = @dishes.near(@address, @distance) if @address.present?
    @dishes = @dishes.where("dishes.name ILIKE ?", "#{@dish}") if @dish.present?
    @dishes = @dishes.where("dishes.price <=", "#{@price}") if @price.present?

    @dishes = @dishes.to_a
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
