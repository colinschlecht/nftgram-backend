class EventSerializer
  include JSONAPI::Serializer
  attributes 
  set_key_transform :camel_lower
end
