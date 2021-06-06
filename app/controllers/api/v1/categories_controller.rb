class Api::V1::CategoriesController < ApplicationController
  # skip_before_action :authorized

  def index
    categories = Category.all
    render json: categories
  end

  def show
    category = Category.find(params[:id])
    render json: category
  end

  def create
    category = Category.create(category_params)
    render json: category
  end

  def create
    category = Category.create(category_params)
    render json: category
  end

  private

  def category_params
    params.permit(:name)
  end
end
