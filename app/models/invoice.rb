class Invoice < ActiveRecord::Base
  belongs_to :user
  belongs_to :own_company, class_name: 'Company'
  belongs_to :other_company, class_name: 'Company'
  has_many :items
  validates :number_of_invoice, :data_of_sold, :data_build, :method_of_payment,
    :own_company_id, :other_company_id, :user_id, presence: true
  validates :number_of_invoice, :uniqueness => {:message => I18n.t('invoices.uniqueness_message')}

  Payment_method = [I18n.t('invoices.cash'), I18n.t('invoices.transfer'), I18n.t('invoices.credit_card')]
end
