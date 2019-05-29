class Restaurant < ApplicationRecord
  has_many :dishes, dependent: :destroy

  validates :name, presence: true, uniqueness: false
  validates :photo, presence: true
  validates :address, presence: true

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
