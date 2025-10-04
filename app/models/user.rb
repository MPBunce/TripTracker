class User < ApplicationRecord
  has_secure_password

  has_many :sessions, dependent: :destroy
  has_many :trips, dependent: :destroy

  # Follow relationships
  has_many :follows_as_follower, class_name: "Follow", foreign_key: "follower_id", dependent: :destroy
  has_many :follows_as_followee, class_name: "Follow", foreign_key: "followee_id", dependent: :destroy

  has_many :following, through: :follows_as_follower, source: :followee
  has_many :followers, through: :follows_as_followee, source: :follower

  validates :email_address, presence: true, uniqueness: true

  has_one_attached :profile_image
  validates :profile_image, content_type: ['image/png', 'image/jpeg', 'image/gif'],
                            size: { less_than: 5.megabytes }
end
