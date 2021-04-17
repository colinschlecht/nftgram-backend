class Like < ApplicationRecord
  belongs_to :user
  belongs_to :art
  belongs_to :comment
end
