class AddLikesCountToAccounts < ActiveRecord::Migration
  def change
    add_column :accounts, :likes_count, :integer, default: 0
  end
end
