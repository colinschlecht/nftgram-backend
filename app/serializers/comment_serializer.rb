class CommentSerializer < ActiveModel::Serializer
  belongs_to :user
  has_many :likes
  attributes :id, :user_id, :commentable_id, :commentable_type, :comment, :created_at, :user, :likes, :comments


  def comments
    ActiveModelSerializers::SerializableResource.new(object.comments,  each_serializer: CommentSerializer)
  end
end
