class UserSerializer < ActiveModel::Serializer
  has_many :arts
  has_many :likes
  has_many :comments
  attributes :id, :username, :artist_id, :metamask_account, :bio, :avatar, :created_at, :updated_at
end
