class Item < ActiveRecord::Base
  belongs_to :invoice
  validates :name_of_service, :qty, :unit, :unit_net_price, :invoice_id, :vat_rate, presence: true
end
