class Restaurant < ApplicationRecord
  has_many :dishes, dependent: :destroy

  mount_uploader :photo, PhotoUploader

  validates :name, presence: true, uniqueness: false
  validates :photo, presence: true, uniqueness: false
  validates :address, presence: true

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  def self.find_or_create(params)
    restaurant = self.find_by('place_id @@ ?', params['place_id'])
    if restaurant
      restaurant
    else
      restaurant = self.new(name: params['name'], address: params['formatted_address'], price_range: params['price_level'], place_id: params['place_id'])

      # EnrichRestaurantJob.perform_later(restaurant.place_id)
      @client = GooglePlaces::Client.new(ENV['GOOGLE_PLACES'])

      spot = @client.spot(restaurant.place_id)

      restaurant.remote_photo_url = spot.photos[0].fetch_url(800)
      restaurant.save
      restaurant
    end
  end
end
