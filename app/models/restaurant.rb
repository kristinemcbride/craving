class Restaurant < ApplicationRecord
  has_many :dishes, dependent: :destroy

  validates :name, presence: true, uniqueness: false
  validates :photo, presence: true, uniqueness: false
  validates :address, presence: true

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  def self.find_or_create(params)
    binding.pry
    restaurant = self.find_by('name @@ ? AND address @@ ?', params[:name], params[:address])
    if restaurant
      restaurant
    else
      restaurant = self.new(params)
      restaurant.save
      restaurant
    end
  end
end
