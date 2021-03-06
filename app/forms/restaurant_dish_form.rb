class RestaurantDishForm
  include ActiveModel::Model

  attr_accessor :user_id, :restaurant_name, :dish_name, :restaurant_data, :dish_photo, :dish_price, :dish_category, :dish_photo_cache, :dish_rating, :dish, :restaurant

  validates :restaurant_name, :dish_name, :dish_photo, :dish_price, :dish_rating, :dish_category, presence: true

  def initialize(attributes = {})
    @restaurant_name = attributes[:restaurant_name]
    @dish_name = attributes[:dish_name]
    @restaurant_data = JSON.parse(attributes[:restaurant_data]) if attributes[:restaurant_data]
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
    this_restaurant = create_restaurant
    create_dish(
      name: dish_name,
      price: dish_price,
      category: dish_category,
      restaurant: this_restaurant,
      user_id: user_id,
      photo: dish_photo
      )
  end

  def create_restaurant
    @restaurant = Restaurant.find_or_create(restaurant_data)
  end

  def create_dish(dish_attributes)
    @dish = Dish.rate_and_create(dish_attributes)
  end
end
