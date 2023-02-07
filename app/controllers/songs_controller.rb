class SongsController < ApplicationController
  before_action :set_song, only: %i[ show edit update destroy ]
  before_action :authenticate_user!
  before_action :authorize_user, only: %i[edit update destroy]

  # GET /songs or /songs.json
  def index
    @songs = Song.all
  end

  # GET /songs/1 or /songs/1.json
  def show
  end

  # GET /songs/new
  def new
    @song = Song.new
  end

  # GET /songs/1/edit
  def edit
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
    song_params[:tags].split(',').each do |tag|
      @song.tags.push(Tag.find_or_create_by(name: tag.strip))
    end

    respond_to do |format|
      if @song.save
        format.html { redirect_to song_url(@song), notice: "Song was successfully created." }
        format.json { render :show, status: :created, location: @song }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @song.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /songs/1 or /songs/1.json
  def update
    respond_to do |format|
      if @song.update(song_params)
        format.html { redirect_to song_url(@song), notice: "Song was successfully updated." }
        format.json { render :show, status: :ok, location: @song }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @song.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /songs/1 or /songs/1.json
  def destroy
    @song.destroy

    respond_to do |format|
      format.html { redirect_to songs_url, notice: "Song was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_song
    @song = Song.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def song_params
    params.require(:song).permit(:mp3, :title, :collaborators, :album_title,
                                 :album_collaborators, :genre, :tags, :terms_of_service)
  end
end
