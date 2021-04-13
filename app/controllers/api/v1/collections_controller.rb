class Api::V1::CollectionsController < ApplicationController
    def index
        collections = Collection.all 
        render json: collections
    end

    def show  
        collection = Collection.find(params[:id])
        render json: collection
    end

    def create 
        collection = Collection.create(collection_params)
        render json: collection
    end

    def update 
        collection = Collection.find(params[:id])
        Collection.update(collection: params[:collection])
        render json: collection
    end

private
    def collection_params
        params.permit(:name)
      end
end
