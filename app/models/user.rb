class User < ActiveRecord::Base
  has_many :companies
  has_many :invoices
  has_secure_password

  validates :username, :password, :password_confirmation, presence: true
  validates :username, uniqueness: { message: I18n.t('users.username_busy') }
end
