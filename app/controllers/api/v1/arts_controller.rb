class Api::V1::ArtsController < ApplicationController
  # skip_before_action :authorized

  def explore
    items = params[:page].to_i * 21
    arts = Art.order("created_at DESC").limit(21).offset(items)
    render json: arts
  end

  def index
    arts = Art.all
    render json: arts
  end

  def show
    art = Art.find(params[:id])
    render json: art
  end

  def create
    categ = Category.find_or_create_by(name: art_params[:category].downcase)
    new_params = art_params.except("category", "artwork")
    
    art = Art.new(new_params)
    art.category_id = categ.id
    if art.save
      # art.artwork.attach(art_params[:artwork])
      render json: art
    else
      render json: { error: "failed to create art" }, status: 400
    end
  end

  private

  def art_params
    params.require(:art).permit(
      :user_id,
      :artist_id,
      :category,
      :for_sale,
      :likes,
      :description,
      :caption,
      :link,
      :cid, 
      :tokenID,
      :tokenURI,
      :contract_address,
      :name
    )
  end
end
