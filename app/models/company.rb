class Company < ActiveRecord::Base
  belongs_to :user

  validates :company_name, :nip, :place_of_taxes, :city, :street, :zip_code, :phone_number, :user_id,
  presence: true
  validates_format_of :nip,
    uniqueness: true, with: /\A[0-9]{3}-[0-9]{3}-[0-9]{2}-[0-9]{2}\Z/,
    message:  I18n.t('companies.validation.nip')
  validates_format_of :place_of_taxes, :city,
    with: /\A[^0-9]+\Z/
  validates_format_of :zip_code,
    with: /\A[0-9]{2}-[0-9]{3}\Z/,
    message: I18n.t('companies.validation.zip_code')
  validates_format_of :phone_number,
    with: /\A([0-9]{3}-[0-9]{3}-[0-9]{3}|[0-9]{2}-[0-9]{3}-[0-9]{2}-[0-9]{2})\Z/,
    message: I18n.t('companies.validation.phone_number')
  validates_presence_of :user
end
