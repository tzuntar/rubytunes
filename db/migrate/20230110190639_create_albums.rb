class CreateAlbums < ActiveRecord::Migration[7.0]
  def change
    create_table :albums do |t|
      t.string :title
      t.string :year
      t.string :art_url

      t.timestamps
    end
  end
end
