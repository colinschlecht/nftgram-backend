require "faker"
class Api::V1::UsersController < ApplicationController
  # skip_before_action :authorized, only: [:create]

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
    if @user.save
      v1 = Artist.create(name: @user.username.to_s, user_id: @user.id)
      render json: { user: UserSerializer.new(@user) }, status: :created
    else
      render json: { error: "failed to create user" }, status: :not_acceptable
    end
  end

  def update
    user = User.find(params[:id])
    User.update(user_params)
    render json: comment
  end

  def show
    user = User.find(params[:id])
    render json: user
  end

  private

  def user_params
    params.permit(:username, :metamask_account, :bio, :avatar)
  end
end

#no longer using
# def getuser
#   render json: { user: UserSerializer.new(current_user) }, status: :accepted
# end
# no longer using
# def create
#   @user = User.create(user_params)
#   if @user.valid?
#     @token = issue_token({ user_id: @user.id })
#     v1 = Artist.create(name: @user.username.to_s, user_id: @user.id)
#     render json: { user: UserSerializer.new(@user), jwt: @token }, status: :created
#   else
#     render json: { error: "failed to create user" }, status: :not_acceptable
#   end
# end
