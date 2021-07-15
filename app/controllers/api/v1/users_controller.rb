require "faker"

class Api::V1::UsersController < ApplicationController

  def index
    users = User.all
    render json: users
  end

  def generate
    pre = Faker::Name.prefix
    verb = Faker::Verb.past
    animal = Faker::Creature::Animal.name
    name = pre + verb.capitalize + animal.capitalize + rand(1..100).to_s
    newname = name.split(/[ ,.\/]/).join("").to_s
    render json: { name: newname }
  end

  def generate_
    pre = Faker::Name.prefix
    verb = Faker::Verb.past
    animal = Faker::Creature::Animal.name
    name = pre + verb.capitalize + animal.capitalize + rand(1..100).to_s
    newname = name.split(/[ ,.\/]/).join("").to_s
  end

  def create
    @user = User.find_or_initialize_by(user_params)
    if !@user.username
      @user.username = generate_
    end
    if !@user.avatar
      @user.avatar = "bafkreicprdfalt566bpr37jj6fo2omfir4alvqgmnk6p6m2qeyu4ipjspq"
    end
    if @user.save
      if !@user.artist
        @user.artist = @user
      end
      render json: { user: UserSerializer.new(@user) }, status: :created
    else
      render json: { error: "failed to create user" }, status: :not_acceptable
    end
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    if @user.save
      render json: @user
    else
      render json: { error: "failed to create user" }, status: :not_acceptable
    end
  end

  def show
    @user = User.find(params[:id])
    render json: @user
  end

  private

  def user_params
    params.require(:user).permit(:username, :metamask_account, :bio, :avatar)
  end
end
