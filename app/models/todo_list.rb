# app/models/todo_list.rb
class TodoList < ApplicationRecord
  belongs_to :trip
  belongs_to :created_by, class_name: "User"
  has_many :todo_items, dependent: :destroy
  
  validates :name, presence: true
  
  scope :active, -> { where(completed: false) }
  
  def completion_percentage
    return 0 if todo_items.count == 0
    (todo_items.completed.count.to_f / todo_items.count * 100).round
  end
end