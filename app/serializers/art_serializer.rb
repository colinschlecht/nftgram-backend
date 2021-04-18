class ArtSerializer < ActiveModel::Serializer
  has_many :events
  has_many :comments
  has_many :collections
  has_many :likes
  belongs_to :user
  belongs_to :artist
  belongs_to :category
  attributes :id, :user_id, :artist_id, :category_id, :for_sale, :likes, :slug, :description, :caption, :value, :link
  #  def self.serializer_for(model, options)
  #   return LikeSerializer if model.class == 'Like'
  #   super
  # end

  # def like 
  #   ActiveModel::SerializableResource.new(object.likes,  each_serializer: LikeSerializer)
  # end

end
