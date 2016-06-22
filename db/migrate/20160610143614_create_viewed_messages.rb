class CreateViewedMessages < ActiveRecord::Migration
  def change
    create_table :viewed_messages do |t|
      t.references :user, index: true, foreign_key: true
      t.references :message, index: true, foreign_key: true

      t.timestamps null: false
    end
    add_index :viewed_messages, [:user_id, :message_id], unique: true
  end
end
