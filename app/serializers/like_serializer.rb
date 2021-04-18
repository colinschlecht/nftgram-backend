class LikeSerializer < ActiveModel::Serializer
  # def self.serializer_for(model, options)
  #   return SparseAdminSerializer if model.class == 'Admin'
  #   super
  # end
  has_one :user
  has_one :art
  has_one :comment
  attributes :id, :user_id, :likeable_id, :likeable_type, :created_at, :updated_at, :user

end

