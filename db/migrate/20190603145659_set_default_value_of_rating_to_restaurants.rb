class SetDefaultValueOfRatingToRestaurants < ActiveRecord::Migration[5.2]
  def change
    change_column :restaurants, :average_rating, :float, default: 0
  end
end
