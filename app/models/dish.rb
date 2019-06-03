class Dish < ApplicationRecord
  belongs_to :restaurant
  belongs_to :user
  has_many :favorites
  has_many :reviews, dependent: :destroy

  mount_uploader :photo, PhotoUploader

  validates :name, presence: true, uniqueness: false
  validates :photo, presence: true
  validates :price, presence: true
  validates :category, presence: true
  validates :user_id, presence: true
  validates :restaurant_id, presence: true

  # geocoded_by :address
  reverse_geocoded_by 'restaurants.latitude', 'restaurants.longitude'
  # after_validation :geocode, if: :will_save_change_to_address?

  def self.rate_and_create(params)
    new_dish = self.new(params)
    new_dish.save
    Favorite.create(user_id: new_dish.user.id, dish_id: new_dish.id)
    new_dish
  end
end
