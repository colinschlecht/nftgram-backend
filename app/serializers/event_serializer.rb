class EventSerializer < ActiveModel::Serializer
  belongs_to :art
  attributes :id, :art_id, :event, :created_at
end
