# app/models/todo_item.rb
class TodoItem < ApplicationRecord
  belongs_to :todo_list
  belongs_to :created_by, class_name: "User"
  belongs_to :assigned_to, class_name: "User", optional: true
  has_many :notes, dependent: :destroy
  
  validates :content, presence: true
  
  scope :completed, -> { where(completed: true) }
  scope :pending, -> { where(completed: false) }
  scope :overdue, -> { where("due_date < ? AND completed = false", Date.current) }
end