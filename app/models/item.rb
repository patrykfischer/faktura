class Item < ActiveRecord::Base
  belongs_to :invoice
  validates :name_of_service, :qty, :unit, :unit_net_price, :invoice_id, :vat_rate, presence: true
  Unit = ['mb','m2','m3','kg','cm','szt.']

  private

  def self.count_value(item)
    item.total_net_price = item.qty * item.unit_net_price
    item.vat_amount = item.total_net_price * item.vat_rate
    item.total_gross_price = item.total_net_price + item.vat_amount
  end
end
