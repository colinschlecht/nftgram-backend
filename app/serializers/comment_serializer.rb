class CommentSerializer < ActiveModel::Serializer
  belongs_to :user
  belongs_to :art
  attributes :id, :user_id, :art_id, :comment, :created_at
end
