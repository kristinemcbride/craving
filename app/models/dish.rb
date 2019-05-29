class Dish < ApplicationRecord
  belongs_to :restaurant
  belongs_to :user
  has_many :favorites

  mount_uploader :photo, PhotoUploader

  validates :name, uniqueness: false

  geocoded_by :address
  # after_validation :geocode, if: :will_save_change_to_address?
end
