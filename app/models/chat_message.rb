# app/models/chat_message.rb
class ChatMessage < ApplicationRecord
  belongs_to :campfire_room
  belongs_to :user
  
  validates :content, presence: true
  
  scope :recent, ->(limit = 50) { order(created_at: :desc).limit(limit) }
  
  # For ActionCable broadcasting
  after_create_commit { broadcast_message }
  
  private
  
  def broadcast_message
    ActionCable.server.broadcast("campfire_#{campfire_room.id}", {
      id: id,
      content: content,
      user_name: user.email_address.split('@').first,
      created_at: created_at.strftime("%H:%M")
    })
  end
end