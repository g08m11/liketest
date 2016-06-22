class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :jobtype
      t.string :title
      t.string :department
      t.date :due
      t.text :requirement
      t.date :scheduled
      t.integer :progress, default: 0
      t.float :timespent, default: 0
      t.date :completed
      t.text :outputcomment

      t.timestamps null: false
    end
  end
end
