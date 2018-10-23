class User < ApplicationRecord
  has_secure_password

  validates :email, presence: true, email: true
  validates :password, presence: true, length: { minimum: 8 }
end
