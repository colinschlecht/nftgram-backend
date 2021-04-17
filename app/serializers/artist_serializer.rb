class ArtistSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :name  
  belongs_to :user
  has_many :arts
  has_many :collections
end
