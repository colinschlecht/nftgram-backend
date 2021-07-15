class User < ApplicationRecord
  has_many :arts
  has_many :comments, through: :arts
  has_many :likes, through: :arts
  has_one :artist, class_name: "User", foreign_key: "artist_id"
  belongs_to :user, class_name: "User", optional: true

  validates :metamask_account, presence: true
  validates :username, uniqueness: true
end
