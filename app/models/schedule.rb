# app/models/schedule.rb
class Schedule < ApplicationRecord
  belongs_to :trip
  has_many :events, dependent: :destroy
  
  validates :name, presence: true
end