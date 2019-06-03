class ChangeRatingToFloat < ActiveRecord::Migration[5.2]
  def change
    remove_column :dishes, :rating
    add_column :dishes, :rating, :float
    remove_column :restaurants, :average_rating
    add_column :restaurants, :average_rating, :float
  end
end
