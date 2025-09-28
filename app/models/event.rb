# app/models/event.rb
class Event < ApplicationRecord
  belongs_to :schedule
  belongs_to :created_by, class_name: "User"
  
  validates :title, :starts_at, presence: true
  
  scope :upcoming, -> { where("starts_at > ?", Time.current) }
  scope :chronological, -> { order(:starts_at) }
  
  def duration
    return nil unless ends_at
    ((ends_at - starts_at) / 1.hour).round(1)
  end
end