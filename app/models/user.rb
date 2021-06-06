class User < ApplicationRecord
    has_many :collections
    has_one :artist
    has_many :arts
    has_many :comments, through: :arts
    has_many :likes, through: :arts
    
    validates :metamask_account, presence: true
    # validates :username, presence: true
    validates :username, uniqueness: true

    accepts_nested_attributes_for :artist

end
