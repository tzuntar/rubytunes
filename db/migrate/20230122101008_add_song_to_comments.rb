class AddSongToComments < ActiveRecord::Migration[7.0]
  def change
    add_reference :comments, :song, null: false, foreign_key: true
  end
end
