class AddUserToSongs < ActiveRecord::Migration[7.0]
  def change
    add_reference :songs, :user, null: true, foreign_key: true
  end
end
