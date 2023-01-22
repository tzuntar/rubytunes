class RemoveRedundantFileUrls < ActiveRecord::Migration[7.0]
  def change
    remove_column :albums, :art_url
    remove_column :artists, :photo_url
    remove_column :songs, :file_url
    remove_column :users, :profile_image_url
  end
end
