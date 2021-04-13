class Collection < ApplicationRecord
  belongs_to :arts
  belongs_to :user
  belongs_to :artist

  def owned
    if self.user_id == self.artist_id
      self.name = "Created"      
    else
      self.name = "Owned" 
    end
  end

end
