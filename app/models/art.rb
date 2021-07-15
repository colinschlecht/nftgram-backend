class Art < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :users, through: :likes
  include Likeable
  include Commentable

  accepts_nested_attributes_for :user, :category
end
