class CreateMaterialfiles < ActiveRecord::Migration
  def change
    create_table :materialfiles do |t|
      t.string :file
      t.references :task, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
