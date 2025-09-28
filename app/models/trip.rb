# app/models/trip.rb
class Trip < ApplicationRecord
  has_many :trip_memberships, dependent: :destroy
  has_many :users, through: :trip_memberships
  
  # Core Basecamp-style tools for trips
  has_many :message_boards, dependent: :destroy
  has_many :todo_lists, dependent: :destroy
  has_many :documents, dependent: :destroy
  has_many :schedules, dependent: :destroy
  has_many :campfire_rooms, dependent: :destroy
  
  belongs_to :creator, class_name: "User"
  
  validates :name, presence: true
  validates :start_date, :end_date, presence: true
  
  enum :status, { planning: 0, active: 1, completed: 2, cancelled: 3 }
  
  after_create :create_default_tools
  
  private
  
  def create_default_tools
    message_boards.create!(name: "General Discussion", description: "Main discussion board for this trip")
    todo_lists.create!(name: "Trip Planning", description: "Main tasks for organizing this trip")
    campfire_rooms.create!(name: "Trip Chat")
    schedules.create!(name: "Trip Schedule")
  end
end