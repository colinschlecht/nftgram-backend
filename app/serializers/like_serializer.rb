class LikeSerializer < ActiveModel::Serializer
  has_one :user
  has_one :art
  has_one :comment
  attributes :id, :user_id, :art_id, :comment_id, :created_at, :updated_at
end
