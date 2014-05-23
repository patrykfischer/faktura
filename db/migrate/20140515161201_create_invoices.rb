class CreateInvoices < ActiveRecord::Migration
  def change
    create_table :invoices do |t|
      t.integer :user_id
      t.integer :number_of_invoice
      t.date :data_of_sold
      t.date :data_build
      t.string :method_of_payment
      t.integer :id_own_company
      t.integer :id_invoice_company

      t.timestamps
    end
  end
end
