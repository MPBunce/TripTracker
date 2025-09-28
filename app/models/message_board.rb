# app/models/message_board.rb
class MessageBoard < ApplicationRecord
  belongs_to :trip
  belongs_to :created_by, class_name: "User"
  has_many :messages, dependent: :destroy
  
  validates :name, presence: true
  
  scope :pinned, -> { where(pinned: true) }
end