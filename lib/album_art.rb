class AlbumArt
  class << self
    def fetch_album_art
      path = ActiveStorage::Blob.service.send(:path_for, @song.mp3.key)
      Mp3Info.open(path) do |mp3|
        pictures = mp3.tag2.pictures
        pictures.each do |description, data|
          path = "tmp/#{description}"
          File.binwrite(path, data)

          @song.album.album_art.attach ActiveStorage::Blob.create_and_upload!(
            io: File.open(path),
            filename: description,
            content_type: 'image/jpeg'
          )
        end
      end
    end
  end
end