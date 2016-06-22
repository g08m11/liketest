class CreateInvoices < ActiveRecord::Migration
  def change
    create_table :invoices do |t|
      t.string :number
      t.date :start
      t.date :end
      t.references :account, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
