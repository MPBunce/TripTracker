class TripDay < ApplicationRecord
  belongs_to :trip
  has_many_attached :images
  
  validates :day_number, presence: true, uniqueness: { scope: :trip_id }
  validates :trip, presence: true
  
  before_validation :set_day_number, on: :create
  
  private
  
  def set_day_number
    if day_number.blank?
      max_day = trip.trip_days.maximum(:day_number) || 0
      self.day_number = max_day + 1
    end
  end
end