class ArtSerializer < ActiveModel::Serializer
  has_many :comments
  has_many :likes
  belongs_to :user
  belongs_to :category
  attributes :id, :user_id, :artist, :category_id, :likes, :comments, :for_sale, :description, :caption, :link, :category, :cid, :name, :created_at, :tokenURI, :tokenID, :contract_address
end



#   def comment_comments
#     altered_comments = []
#     object.comments.map do |com|
#       if com.comments
#         com.comments.map do |comcom|
#           altered_comments.push(comcom)
#         end
#       end
#     end
#     return altered_comments
#   end
# end


# def comment_comments
#     altered_comments = []
#     object.comments.each do |com|
#       custom_com = {}
#       custom_com[:id] = com.id
#       custom_com[:user_id] = com.user_id
#       custom_com[:username] = com.friend.username
#       if friendship.friend.avatar.attached?
#         custom_friend[:avatar] = Rails.application.routes.url_helpers.rails_blob_path(friendship.friend.avatar, only_path: true)
#       end
#       altered_comments.push(custom_friend)
#     end
#     return altered_comments
#   end
