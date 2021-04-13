class Collection < ApplicationRecord
  belongs_to :arts
  belongs_to :user
  belongs_to :artist
end
