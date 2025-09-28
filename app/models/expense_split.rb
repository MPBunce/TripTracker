# app/models/expense_split.rb
class ExpenseSplit < ApplicationRecord
  belongs_to :expense
  belongs_to :user
  
  validates :amount_cents, presence: true, numericality: { greater_than: 0 }
  validates :user_id, uniqueness: { scope: :expense_id }
  
  def amount
    Money.new(amount_cents, expense.currency || "USD")
  end
end