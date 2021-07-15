class Api::V1::CommentsController < ApplicationController

  def index
    comments = Comment.all
    render json: comments
  end

  def show
    comment = Comment.where(params[:id])
    render json: comment
  end

  def create
    comment = Comment.new(comment_params)
    if comment.save
      render json: comment
    else
      render json: { 'message': "Comment Failed" }
    end
  end

  def update
    comment = Comment.find(params[:id])
    comment.update(comment: params[:comment])
    render json: comment
  end

  def destroy
    comment = Comment.find(params[:id])
    comment.destroy
    render json: { 'message': "Delete Successful" }
  end

  private

  def comment_params
    params.permit(:user_id, :comment, :commentable_type, :commentable_id)
  end
end
