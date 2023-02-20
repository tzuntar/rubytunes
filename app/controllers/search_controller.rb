class SearchController < ApplicationController
  before_action :authenticate_user!
  before_action :run_query, only: %i[ show ]

  def show
    render 'searches/show'  # this should be automatic?
  end

  private

  def run_query
    @results = {
      songs: Song.where("UPPER(title) LIKE ?", "%#{params[:query].upcase}%") ,
      albums: Album.where("UPPER(title) LIKE ?", "%#{params[:query].upcase}%"),
      artists: Artist.where("UPPER(name) LIKE ?", "%#{params[:query].upcase}%")
    }
  end

  def search_params
    params.require(:query)
  end

end