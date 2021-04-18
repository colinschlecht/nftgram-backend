class Api::V1::CommentsController < ApplicationController
  skip_before_action :authorized

  def index
    comments = Comment.all
    render json: comments
  end

  def show
    comment = Comment.find(params[:id])
    render json: comment
  end

  def create
    comment = Comment.create(comment_params)
    render json: comment
  end

  def update
    comment = Comment.find(params[:id])
    Comment.update(comment: params[:comment])
    render json: comment
  end

  def destroy
    comment = Comment.find(params[:id])
    Comment.destroy
    render json: { 'message': "Delete Successful" }
  end

  private

  def comment_params
    params.permit(:user_id, :comment, :commentable_type, :commentable_id)
  end
end
