class Review < ApplicationRecord
  belongs_to :dish
  belongs_to :user

  validates :content, presence: true, uniqueness: true
  validates :rating, presence: true
  validates :category, presence: true
  validates :user_id, presence: true
  validates :dish_id, presence: true
  validates :date, presence: true
end
