class Invoice < ActiveRecord::Base
belongs_to :user
has_many :item
validates :number_of_invoice, :data_of_sold, :data_build, :method_of_payment,
:id_own_company, :id_invoice_company, presence: true
validates :number_of_invoice, :uniqueness => {:message => "Faktura z tym numerem jest już wystawiona!"}
end
