class SearchController < ApplicationController
  before_action :authenticate_user!
  before_action :run_query, only: %i[ show ]

  def show
    render 'searches/show'  # this should be automatic?
  end

  private

  def run_query
    #songs: Song.where("UPPER(title) LIKE ?", "%#{params[:query].upcase}%") ,
    #albums: Album.where("UPPER(title) LIKE ?", "%#{params[:query].upcase}%"),
    #artists: Artist.where("UPPER(name) LIKE ?", "%#{params[:query].upcase}%")
    @results = {
      songs: Song.kinda_spelled_like(params[:query]),
      albums: Album.kinda_spelled_like(params[:query]),
      artists: Artist.kinda_spelled_like(params[:query])
    }
  end

  def search_params
    params.require(:query)
  end

end