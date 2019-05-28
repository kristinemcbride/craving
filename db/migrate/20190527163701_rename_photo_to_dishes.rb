class RenamePhotoToDishes < ActiveRecord::Migration[5.2]
  def change
    rename_column :dishes, :photo_url, :photo
  end
end
