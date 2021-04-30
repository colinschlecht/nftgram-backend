class Art < ApplicationRecord
  belongs_to :user
  belongs_to :artist
  belongs_to :category
  has_many :events
  has_many :collections
  has_many :users, through: :likes
  include Likeable
  include Commentable

  has_one_attached :artwork
  accepts_nested_attributes_for :user, :artist, :category
  # accepts_nested_attributes_for :likes
end
