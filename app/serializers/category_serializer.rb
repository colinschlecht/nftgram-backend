class CategorySerializer < ActiveModel::Serializer
  has_many :arts
  attributes :id, :name
end
