class Trip < ApplicationRecord
  belongs_to :user
  has_many :trip_days, -> { order(:day_number) }, dependent: :destroy
  has_many_attached :images
  
  accepts_nested_attributes_for :trip_days, allow_destroy: true, reject_if: :all_blank
  
  validates :title, presence: true
  validates :user, presence: true
end