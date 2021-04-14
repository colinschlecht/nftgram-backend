class UserSerializer
  include JSONAPI::Serializer

  has_many :collections
  has_many :artists
  has_many :arts
  has_many :comments, through: :arts
  attributes :username
end
