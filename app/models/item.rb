class Item < ActiveRecord::Base
  belongs_to :invoice
  validates :name_of_service, :qty, :unit, :unit_net_price, presence: true
end
