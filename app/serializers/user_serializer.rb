class UserSerializer < ActiveModel::Serializer
  has_many :collections
  has_many :artists
  has_many :arts
  has_many :comments, through: :arts
  attributes :id, :username, :password_digest, :bio, :link
end
