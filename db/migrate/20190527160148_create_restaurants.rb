class CreateRestaurants < ActiveRecord::Migration[5.2]
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :address
      t.integer :average_rating
      t.integer :price_range
      t.string :delivery_url
      t.string :booking_url
      t.float :longitude
      t.float :latitude

      t.timestamps
    end
  end
end
