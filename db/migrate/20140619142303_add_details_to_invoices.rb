class AddDetailsToInvoices < ActiveRecord::Migration
  def change
    change_table :invoices do |t|
      t.references :own_company
      t.references :other_company
    end
  end
end
