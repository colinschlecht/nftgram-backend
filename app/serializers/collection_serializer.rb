class CollectionSerializer < ActiveModel::Serializer
  belongs_to :arts
  belongs_to :user
  belongs_to :artist
  attributes :id, :user_id, :artist_id, :art_id, :name
end
