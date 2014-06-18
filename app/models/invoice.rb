class Invoice < ActiveRecord::Base
  belongs_to :user
  has_many :items
  has_one :own_company, class_name: 'Company', :foreign_key => 'own_company_id'
  has_one :other_company, class_name: 'Company', :foreign_key => 'other_company_id'
  validates :number_of_invoice, :data_of_sold, :data_build, :method_of_payment,
    :own_company_id, :other_company_id, :user_id, presence: true
  validates :number_of_invoice, :uniqueness => {:message => "Faktura z tym numerem jest już wystawiona!"}
end
