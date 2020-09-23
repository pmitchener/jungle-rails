class User < ActiveRecord::Base
  has_secure_password

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false } # The default error message is "has already been taken".
  validates :password, presence: true
  validates :password_confirmation, presence: true
end
