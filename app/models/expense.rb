# app/models/expense.rb
class Expense < ApplicationRecord
  belongs_to :trip
  belongs_to :paid_by, class_name: "User"
  belongs_to :activity, optional: true
  has_many :expense_splits, dependent: :destroy
  has_many :participants, through: :expense_splits, source: :user
  
  validates :description, :amount_cents, presence: true
  validates :amount_cents, numericality: { greater_than: 0 }
  
  # Using Rails 8's built-in money handling or you can still use money-rails
  def amount
    Money.new(amount_cents, currency || "USD")
  end
  
  def amount=(value)
    if value.is_a?(Money)
      self.amount_cents = value.cents
      self.currency = value.currency.to_s
    else
      self.amount_cents = (value.to_f * 100).to_i
    end
  end
end