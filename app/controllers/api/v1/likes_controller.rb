class Api::V1::LikesController < ApplicationController
  skip_before_action :authorized

    def create
        like = Like.create(like_params)
        render json: like
      end

      def destroy
        like = Like.find(like_params[:id])
        like.destroy
        render json: { 'message': "Delete Successful" }
      end

      private
      def like_params
        params.permit(:id, :likeable_id, :user_id, :likeable_type)
      end
end
