class LikeSerializer < ActiveModel::Serializer
 
  has_one :user
  
 
  attributes :id, :user_id, :likeable_id, :likeable_type, :created_at, :updated_at, :user

end

