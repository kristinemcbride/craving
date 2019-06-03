class SetDefaultValueOfRatingToDish < ActiveRecord::Migration[5.2]
  def change
    change_column :dishes, :rating, :float, default: 0
  end
end
