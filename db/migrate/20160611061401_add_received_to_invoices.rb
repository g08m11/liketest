class AddReceivedToInvoices < ActiveRecord::Migration
  def change
    add_column :invoices, :received, :date
  end
end
