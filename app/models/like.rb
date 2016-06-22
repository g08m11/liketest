class Like < ActiveRecord::Base
  belongs_to :user
  belongs_to :account, counter_cache: :likes_count
end
