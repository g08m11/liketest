class AddAnnounceToAccounts < ActiveRecord::Migration
  def change
    add_column :accounts, :announce, :string
  end
end
