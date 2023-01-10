class AddFileUrlToSongs < ActiveRecord::Migration[7.0]
  def change
    add_column :songs, :file_url, :string
  end
end
