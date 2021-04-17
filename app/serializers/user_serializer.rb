class UserSerializer < ActiveModel::Serializer
  has_many :collections
  has_many :artists
  has_many :arts
  has_many :likes
  has_many :comments
  attributes :id, :username, :password_digest, :bio, :link
end
