class CreateJoinTableSongsTags < ActiveRecord::Migration[7.0]
  def change
    create_join_table :songs, :tags do |t|
      t.index [:song_id, :tag_id]
      t.index [:tag_id, :song_id]
    end
    add_foreign_key :songs_tags, :songs
    add_foreign_key :songs_tags, :tags
  end
end
