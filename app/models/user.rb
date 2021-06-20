class User < ApplicationRecord
  validates :username, presence: true, length: { minimum: 4, maximum: 18 }
  has_secure_password
end
