class AddInvoiceToTasks < ActiveRecord::Migration
  def change
    add_reference :tasks, :invoice, index: true, foreign_key: true
  end
end
