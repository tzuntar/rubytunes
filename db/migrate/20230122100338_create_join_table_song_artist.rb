class CreateJoinTableSongArtist < ActiveRecord::Migration[7.0]
  def change
    create_join_table :songs, :artists do |t|
      t.index [:song_id, :artist_id]
      t.index [:artist_id, :song_id]
    end
    add_foreign_key :artists_songs, :songs
    add_foreign_key :artists_songs, :artists
  end
end
