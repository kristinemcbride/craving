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
    dish = self.new(params)
    dish.rating = 0
    # dish.user.favorites << dish
    dish.save
    dish
  end
end
