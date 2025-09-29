class User < ApplicationRecord
  has_secure_password
  
  has_many :sessions, dependent: :destroy
  has_many :posts, dependent: :destroy
  # ... other associations
  
  validates :email_address, presence: true, uniqueness: true
end