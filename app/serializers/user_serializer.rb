class UserSerializer < ActiveModel::Serializer
  has_many :arts
  has_many :likes
  has_many :comments
  attributes :id, :username, :metamask_account, :bio, :avatar
end
