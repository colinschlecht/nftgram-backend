class Artist < ApplicationRecord
  belongs_to :user
  has_many :arts
  has_many :collections
  has_many :categories, through: :arts
end
