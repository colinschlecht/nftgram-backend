class Art < ApplicationRecord
  belongs_to :collection
  belongs_to :user
  belongs_to :artist
end
