class ArtSerializer < ActiveModel::Serializer
  has_many :events
  has_many :comments
  has_many :collections
  belongs_to :user
  belongs_to :artist
  belongs_to :category
  attributes :id, :user_id, :artist_id, :category_id, :for_sale, :likes, :slug, :description, :caption, :value, :link
end
