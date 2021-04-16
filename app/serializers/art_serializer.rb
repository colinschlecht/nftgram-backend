class ArtSerializer
  include JSONAPI::Serializer
  belongs_to :user
  belongs_to :artist
  belongs_to :category
  has_many :events
  has_many :comments
  has_many :collections

  set_key_transform :camel_lower

  attributes :id, :user, :artist_id, :category_id, :user_id, :for_sale, :likes, :slug, :description, :caption, :value, :link

  
end
