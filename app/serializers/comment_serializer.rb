class CommentSerializer < ActiveModel::Serializer
  belongs_to :user
  has_many :likes
  attributes :id, :user_id, :commentable_id, :commentable_type, :comment, :created_at, :user, :likes, :comments

  # def comments
  #   altered_comments = []
  #   object.comments.map do |com|
  #     altered_comments.push(com)
  #   end
  #   return altered_comments
  # end

  def comments
    # console says depreciated
    # ActiveModel::SerializableResource.new(object.comments,  each_serializer: CommentSerializer)
    ActiveModelSerializers::SerializableResource.new(object.comments,  each_serializer: CommentSerializer)
  end
end

# def comment_comments
#     altered_comments = []
#     object.comments.each do |com|
#       custom_com = {}
#       custom_com[:id] = com.id
#       custom_com[:user_id] = com.user_id
#       custom_com[:username] = com.friend.username
#       if friendship.friend.avatar.attached?
#         custom_friend[:avatar] = Rails.application.routes.url_helpers.rails_blob_path(friendship.friend.avatar, only_path: true)
#       end
#       altered_comments.push(custom_friend)
#     end
#     return altered_comments
#   end
