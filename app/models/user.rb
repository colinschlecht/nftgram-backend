class User < ApplicationRecord
    has_many :collections
    has_many :artists
    has_many :arts
    has_many :comments, through: :arts
    has_many :likes, through: :arts
    has_secure_password
    validates :username, presence: true
    validates :username, uniqueness: true


end
