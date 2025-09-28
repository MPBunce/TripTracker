# app/models/activity.rb
class Activity < ApplicationRecord
  belongs_to :trip
  belongs_to :created_by, class_name: "User"
  has_many :activity_participants, dependent: :destroy
  has_many :participants, through: :activity_participants, source: :user
  has_many :expenses, dependent: :destroy
  
  validates :name, presence: true
  
  enum :activity_type, {
    accommodation: 0,
    transportation: 1, 
    dining: 2,
    entertainment: 3,
    sightseeing: 4,
    other: 5
  }
  
  scope :upcoming, -> { where("start_time > ?", Time.current) }
  scope :by_date, -> { order(:start_time) }
end