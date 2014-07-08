class Company < ActiveRecord::Base
  belongs_to :user

  validates :company_name, :nip, :place_of_taxes, :city, :street, :zip_code, :phone_number,
  presence: true
  validates_format_of :nip,
    uniqueness: true, with: /\A[0-9]{3}-[0-9]{3}-[0-9]{2}-[0-9]{2}\Z/,
    message: "NIP powinien się składać z cyfr w formacie xxx-xxx-xx-xx"
  validates_format_of :place_of_taxes, :city,
    with: /\A[^0-9]+\Z/
  validates_format_of :zip_code,
    with: /\A[0-9]{2}-[0-9]{3}\Z/,
    message: "Kod pocztowy powinien składać się z samych cyfr w formacie xx-xxx"
  validates_format_of :phone_number,
    with: /\A([0-9]{3}-[0-9]{3}-[0-9]{3}|[0-9]{2}-[0-9]{3}-[0-9]{2}-[0-9]{2})\Z/,
    message: "Numer telefonu powinien składać się z samych cyfr i być w formacie  xx-xxx-xx-xx lub xxx-xxx-xxx"
  validates_presence_of :user
end
