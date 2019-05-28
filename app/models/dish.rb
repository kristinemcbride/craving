class Dish < ApplicationRecord
  belongs_to :restaurant
  belongs_to :user
  has_many :favorites

  mount_uploader :photo, PhotoUploader
end
