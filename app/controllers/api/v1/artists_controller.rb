class Api::V1::ArtistsController < ApplicationController
  skip_before_action :authorized


  def show
    artist = Artist.find(params[:id])
    render json: artist
  end

  def create
    artist = Artist.create(artist_params)
  end

  private

  def artist_params
    params.permit(:name)
  end
end
