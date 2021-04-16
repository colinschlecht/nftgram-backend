class Api::V1::ArtsController < ApplicationController
  skip_before_action :authorized

  def explore
    items = params[:page].to_i * 21
    arts = Art.order("created_at DESC").limit(21).offset(items)
    json_string = ArtSerializer.new(arts).serializable_hash.to_json
    render json: json_string
  end

  def index
    arts = Art.all
    json_string = ArtSerializer.new(arts).serializable_hash.to_json
    render json: json_string
  end

  def show
    art = Art.find(params[:id])
    render json: art
  end

  def create
    art = Art.create(art_params)
    render json: art
  end

  # custom route from brewproj
  # def getstates
  #     states = Art.all.map{|art| art.state }.uniq.compact.sort
  #     render json: states
  # end
  # custom route from brewproj
  # def state
  #     arts = Art.all.where(state: params[:state])
  #     render json: arts
  # end
  # custom route from brewproj
  # def washington
  #     arts = Art.all.where(state: "Washington")
  #     render json: arts
  # end

  private

  def art_params
    params.permit(
      :collection_id,
      :user_id,
      :artist_id,
      :category_id,
      :for_sale,
      :likes,
      :slug,
      :description,
      :caption,
      :value,
      :link
    )
  end
end
