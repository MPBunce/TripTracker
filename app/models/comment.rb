# app/models/comment.rb
class Comment < ApplicationRecord
  belongs_to :message
  belongs_to :author, class_name: "User"
  
  validates :content, presence: true
  
  scope :chronological, -> { order(:created_at) }
end