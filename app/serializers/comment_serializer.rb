class CommentSerializer < ActiveModel::Serializer
  belongs_to :user
  belongs_to :art
  attributes :id, :comments, :user_id, :art_id, :comment, :created_at
end
