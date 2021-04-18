class CommentSerializer < ActiveModel::Serializer
  # def self.serializer_for(model, options)
  #   return ArtSerializer if model.class == 'Art'
  #   super
  # end
  belongs_to :user
  has_many :likes
  attributes :id, :user_id, :commentable_id, :commentable_type, :comment, :created_at, :user
end
