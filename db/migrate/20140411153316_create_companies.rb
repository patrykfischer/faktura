class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.belongs_to :user
			t.string :company_name
      t.string :nip
      t.string :place_of_taxes
      t.string :city
      t.string :street
      t.string :zip_code
      t.string :bank
      t.string :account_number
      t.string :phone_number

      t.timestamps
    end
  end
end
