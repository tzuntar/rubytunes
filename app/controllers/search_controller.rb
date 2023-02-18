class SearchController < ApplicationController
  before_action :authenticate_user!
  before_action :run_query, only: %i[ show ]

  def show
    render 'searches/show'  # this should be automatic?
  end

  private

  def run_query
    @results = {
      songs: Song.find_by_title("%#{:query}%"),
      albums: Album.find_by_title("%#{:query}%"),
      artists: Artist.find_by_name("%#{:query}%")
    }
  end

  def search_params
    params.require(:query)
  end

end