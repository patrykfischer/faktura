class User < ActiveRecord::Base
  has_many :company
  has_many :invoice
  has_secure_password

	validates :username, :password, :password_confirmation, presence: true
  validates :username, :uniqueness => {:message => "Ta nazwa użytkownika jest już zajęta!"}
end
