class Api::V1::CollectionsController < ApplicationController
  # skip_before_action :authorized

  def index
    collections = Collection.all
    render json: collections
  end

  def show
    collection = Collection.find(params[:id])
    render json: collection
  end

  def create
    collection = Collection.new(collection_params)
    collection.owned
    if collection.save
      render json: collection
    else
      render json: { error: "Collection not saved" }
    end
  end

  def update
    collection = Collection.find(params[:id])
    Collection.update(collection: params[:collection])
    render json: collection
  end

  private

  def collection_params
    params.permit(:name, :art_id, :user_id, :artist_id)
  end
end
