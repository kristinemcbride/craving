class RestaurantDishForm
  include ActiveModel::Model

  attr_accessor :user_id, :restaurant_name, :dish_name, :restaurant_address, :dish_photo, :dish_price, :dish_category, :dish_photo_cache, :dish_rating, :dish, :restaurant

  validates :restaurant_name, :dish_name, :restaurant_address, :dish_photo, :dish_price, :dish_category, :dish_rating, presence: true

  def initialize(attributes = {})
    @restaurant_name = attributes[:restaurant_name]
    @dish_name = attributes[:dish_name]
    @restaurant_address = attributes[:restaurant_address]
    @dish_photo = attributes[:dish_photo]
    @dish_price = attributes[:dish_price]
    @dish_rating = attributes[:dish_rating]
    @dish_category = attributes[:dish_category]
    @dish_photo_cache = attributes[:dish_photo_cache]
    @user_id = attributes[:user_id]
  end

  def save
    persist!
  end

  private

  def persist!
    create_restaurant && create_dish
  end

  def create_restaurant
    @restaurant = Restaurant.find_or_create(
      name: restaurant_name,
      address: restaurant_address,
      photo: 'https://media-cdn.tripadvisor.com/media/photo-w/0e/cc/0a/dc/restaurant-chocolat.jpg'
    )
  end

  def create_dish
    @dish = Dish.create(name: dish_name, price: dish_price, category: dish_category, restaurant: restaurant, user_id: user_id, photo: @dish_photo, rating: dish_rating)
  end

end
