class User < ApplicationRecord
  validates :username, presence: true, length: { minimum: 4, maximum: 36 },
            uniqueness: { case_sensitive: false }
  has_many :messages
  has_secure_password
end
