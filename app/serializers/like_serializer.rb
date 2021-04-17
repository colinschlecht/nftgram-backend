class LikeSerializer < ActiveModel::Serializer
  belongs_to :user
  belongs_to :art
  attributes :id, :user_id, :art_id, :created_at, :updated_at
end
