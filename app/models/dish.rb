class Dish < ApplicationRecord
  belongs_to :restaurant
  belongs_to :user
  has_many :favorites

  mount_uploader :photo, PhotoUploader

  validates :name, presence: true, uniqueness: false
  validates :photo, presence: true
  validates :price, presence: true
  validates :rating, presence: true
  validates :category, presence: true
  validates :user_id, presence: true
  validates :restaurant_id, presence: true

  geocoded_by :address
  # after_validation :geocode, if: :will_save_change_to_address?
end
