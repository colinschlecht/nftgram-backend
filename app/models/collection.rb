class Collection < ApplicationRecord
  has_many :arts
  belongs_to :user
end
