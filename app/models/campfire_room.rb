# app/models/campfire_room.rb
class CampfireRoom < ApplicationRecord
  belongs_to :trip
  has_many :chat_messages, dependent: :destroy
  
  validates :name, presence: true
end