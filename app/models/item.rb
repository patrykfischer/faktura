class Item < ActiveRecord::Base
  belongs_to :invoice
  validates :name_of_service, :qty, :unit, :unit_net_price, :invoice_id, :vat_rate, presence: true
  Unit = ['mb','m2','m3','kg','cm','szt.']

  def count_value
    self.total_net_price = qty * unit_net_price
    self.vat_amount = total_net_price * vat_rate
    self.total_gross_price = total_net_price + vat_amount
  end
end
