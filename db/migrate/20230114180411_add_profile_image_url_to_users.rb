class AddProfileImageUrlToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :profile_image_url, :string
  end
end
