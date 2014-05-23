class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.integer :invoice_id
      t.string  :name_of_service
      t.string  :pkwiu
      t.integer :qty
      t.integer :unit
      t.float   :unit_net_price
      t.float   :total_net_price
      t.float   :vat_rate
      t.float   :vat_amount
      t.float   :total_gross_price

      t.timestamps
    end
  end
end
