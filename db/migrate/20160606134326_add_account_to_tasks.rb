class AddAccountToTasks < ActiveRecord::Migration
  def change
    add_reference :tasks, :account, index: true, foreign_key: true
  end
end
