class Account < ActiveRecord::Base
  has_many :users
  has_many :likes

  def like_user(user)
   likes.find_by(user_id: user)
  end
end
