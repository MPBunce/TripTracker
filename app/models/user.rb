class User < ApplicationRecord
  has_secure_password
  
  has_many :sessions, dependent: :destroy
  has_many :trips, dependent: :destroy
  # ... other associations
  
  validates :email_address, presence: true, uniqueness: true

  has_one_attached :profile_image
  
  # Optional: Add validation
  # Optional: Add validation
  validates :profile_image, content_type: ['image/png', 'image/jpeg', 'image/gif'],
    size: { less_than: 5.megabytes }

end