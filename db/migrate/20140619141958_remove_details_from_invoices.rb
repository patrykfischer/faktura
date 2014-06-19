class RemoveDetailsFromInvoices < ActiveRecord::Migration
  def change
    change_table :invoices do |t|
      t.remove :own_company_id
      t.remove :other_company_id
    end
  end
end
