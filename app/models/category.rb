class Category < ApplicationRecord
    has_many :arts
    has_many :artists
end
