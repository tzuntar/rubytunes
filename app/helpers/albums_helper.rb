module AlbumsHelper

  def album_art_or_placeholder_for_album(album, classes)
    url = album.album_art.attached? ? polymorphic_url(album.album_art.attachment) : 'icons/avatar.svg'
    image_tag(url, class: classes, id: 'albumArtBox', alt: 'Album Art')
  end

end