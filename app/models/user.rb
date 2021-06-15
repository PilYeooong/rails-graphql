class User < ApplicationRecord
  has_secure_password
  validates :email, uniqueness: true
  has_one :profile, dependent: :destroy
end
