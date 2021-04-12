class Art < ApplicationRecord
  belongs_to :collection
  belongs_to :user
  belongs_to :artist
  belongs_to :category
  has_many :events
  has_many :comments
  
end
