class Review < ApplicationRecord
  belongs_to :dish
  belongs_to :user
  validates :rating, presence: true
  validates :user_id, presence: true
  validates :dish_id, presence: true
  # validates :date, presence: true
end
