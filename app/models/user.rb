class User < ApplicationRecord 
  validates :email, uniqueness: true, presence: true, format: { with: /\A[^@\s]+@[^@\s]+\z/, message: "must be a valid email" }

  has_secure_password
end 