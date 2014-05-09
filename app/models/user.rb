class User < ActiveRecord::Base
  has_many :company
  has_secure_password

	#validates :username, uniqueness: true
	#validates :username, :password, presence: true
end
