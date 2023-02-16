module SongsHelper

  def edit_button
    link_to edit_song_url do
      button_tag class: 'play-button' do
        image_tag 'icons/edit', class: 'icon-make-smaller', alt: 'Edit'
      end
    end
  end

  def delete_button
    link_to song_url, data: { confirm: 'Are you sure you would like to delete this song? This action cannot be undone' }, method: :delete do
      button_tag class: 'play-button' do
        image_tag 'icons/delete', class: 'icon-make-smaller', alt: 'Delete'
      end
    end
  end

end
