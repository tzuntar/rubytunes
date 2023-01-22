class CreateJoinTableAlbumSong < ActiveRecord::Migration[7.0]
  def change
    create_join_table :albums, :songs do |t|
      t.index [:album_id, :song_id]
      t.index [:song_id, :album_id]
    end
    add_foreign_key :albums_songs, :albums
    add_foreign_key :albums_songs, :songs
  end
end
