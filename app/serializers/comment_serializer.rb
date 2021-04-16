class CommentSerializer
  include JSONAPI::Serializer
  belongs_to :user
  belongs_to :art
  attributes :user_id, :art_id, :comment
  set_key_transform :camel_lower
end
