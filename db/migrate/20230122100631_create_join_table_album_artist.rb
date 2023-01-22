class CreateJoinTableAlbumArtist < ActiveRecord::Migration[7.0]
  def change
    create_join_table :albums, :artists do |t|
      t.index [:album_id, :artist_id]
      t.index [:artist_id, :album_id]
    end
    add_foreign_key :albums_artists, :albums
    add_foreign_key :albums_artists, :artists
  end
end
