# app/models/user.rb
class User < ApplicationRecord
  has_secure_password
  has_many :sessions, dependent: :destroy
  
  # Trip memberships
  has_many :trip_memberships, dependent: :destroy
  has_many :trips, through: :trip_memberships
  has_many :created_trips, class_name: "Trip", foreign_key: "creator_id"
  
  # Tool associations
  has_many :messages, foreign_key: "author_id", dependent: :destroy
  has_many :comments, foreign_key: "author_id", dependent: :destroy
  has_many :todo_items, foreign_key: "assigned_to_id"
  has_many :created_todo_items, class_name: "TodoItem", foreign_key: "created_by_id"
  has_many :chat_messages, dependent: :destroy
  has_many :documents, foreign_key: "uploaded_by_id", dependent: :destroy
  has_many :events, foreign_key: "created_by_id", dependent: :destroy
  
  normalizes :email_address, with: ->(e) { e.strip.downcase }
  
  def display_name
    email_address.split('@').first.humanize
  end
end