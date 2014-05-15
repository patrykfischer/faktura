class Invoice < ActiveRecord::Base
validates :number_of_invoice, :date_of_sold, :data_of_sold, :data_build, :method_of_paymant,
:id_own_company, :id_invoice_company, presence: true
end
