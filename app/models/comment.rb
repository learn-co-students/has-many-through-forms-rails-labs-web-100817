class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :post

  def comment_user=(ayy)
    (self.user = User.find_or_create_by(username: ayy)) unless self.user_id
  end

end
