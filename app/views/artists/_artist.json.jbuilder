json.extract! artist, :id, :name, :photo_url, :created_at, :updated_at
json.url artist_url(artist, format: :json)
