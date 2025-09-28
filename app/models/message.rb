# app/models/message.rb
class Message < ApplicationRecord
  belongs_to :message_board
  belongs_to :author, class_name: "User"
  has_many :comments, dependent: :destroy
  
  validates :title, :content, presence: true
  
  scope :recent, -> { order(created_at: :desc) }
end