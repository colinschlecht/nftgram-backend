class CategorySerializer < ActiveModel::Serializer
  has_many :arts
  has_many :artists
  attributes :id, :name
end
