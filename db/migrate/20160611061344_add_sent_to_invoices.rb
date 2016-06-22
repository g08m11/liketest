class AddSentToInvoices < ActiveRecord::Migration
  def change
    add_column :invoices, :sent, :date
  end
end
