class Item < ActiveRecord::Base
  validates :name_of_service, :qty, :unit, :unit_net_price, presence: true
end
