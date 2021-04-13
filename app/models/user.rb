class User < ApplicationRecord
    has_many :collections
    has_many :artists
    has_many :arts
    has_many :comments, through: :arts

end
