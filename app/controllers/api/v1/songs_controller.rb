class Api::V1::SongsController < ActionController::API
  before_action :set_song, only: [:show, :update, :destroy]

  # GET /songs or /songs.json
  def index
    @songs = Song.all
    render json: @songs.to_json, status: :ok
  end

  # GET /songs/1 or /songs/1.json
  def show
  end

  # POST /songs or /songs.json
  def create
    @song = Song.new(title: song_params[:title])
    @song.mp3.attach(song_params[:mp3])
    @song.album = Album.find_or_create_by(title: song_params[:album_title])
    # the current user is also the main author
    @song.artists.push(Artist.find_or_create_by(name: current_user.name))
    song_params[:collaborators].split(',').each do |collaborator|
      @song.artists.push(Artist.find_or_create_by(name: collaborator.strip))
    end
    @song.album.artists.push(Artist.find_or_create_by(name: current_user.name))
    song_params[:album_collaborators].split(',').each do |collaborator|
      @song.album.artists.push(Artist.find_or_create_by(name: collaborator.strip))
    end
    @song.user = current_user
    @song.genre = Genre.find_or_create_by(name: song_params[:genre])
    song_params[:tags_entry].split(',').each do |tag|
      @song.tags.push(Tag.find_or_create_by(name: tag.strip))
    end

    respond_to do |format|
      if @song.save
        if @song.album.album_art.blank?
          AlbumArt.fetch_album_art
        end
        format.json { render :show, status: :created, location: @song }
      else
        format.json { render json: @song.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /songs/1 or /songs/1.json
  def update
    #@song.album.destroy
    @song.album = Album.find_or_create_by(title: song_params[:album_title])
    @song.genre = Genre.find_or_create_by(name: song_params[:genre])

    #@song.artists.destroy_all
    @song.artists = []
    song_params[:collaborators].split(',').each do |collaborator|
      @song.artists.push(Artist.find_or_create_by(name: collaborator.strip))
    end

    #@song.album.artists.destroy_all
    song_params[:album_collaborators].split(',').each do |collaborator|
      artist = Artist.find_or_create_by(name: collaborator.strip)
      unless @song.album.artists.include?(artist)
        @song.album.artists.push(artist)
      end
    end

    #@song.tags.destroy_all
    @song.tags = []
    song_params[:tags_entry].split(',').each do |tag|
      @song.tags.push(Tag.find_or_create_by(name: tag.strip))
    end

    respond_to do |format|
      if @song.save
        format.json { render :show, status: :ok, location: @song }
      else
        format.json { render json: @song.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /songs/1 or /songs/1.json
  def destroy
    @song.destroy
    respond_to do |format|
      format.json { head :no_content }
    end
  end

  # GET /user/:id/songs
  def index_by_user
    @user = User.find(params[:user_id])
    @songs = @user.songs
  end

  private

  def set_song
    @song = Song.find(params[:id])
  end

  def song_params
    params.require(:song).permit(:mp3, :title, :collaborators, :album_title,
                                 :album_collaborators, :genre, :tags_entry, :terms_of_service,
                                 :query)
  end

end
