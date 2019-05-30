class ChangePriceRangeToString < ActiveRecord::Migration[5.2]
  def change
    remove_column :restaurants, :price_range
    add_column :restaurants, :price_range, :string
  end
end
