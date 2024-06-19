class Expense < ApplicationRecord
  belongs_to :user

  enum category: {
    fixed_cost: 0,
    comfort: 1,
    goals: 2,
    pleasures: 3,
    financial_freedom: 4,
    knowledge: 5
  }

  validates :name, :expense_value, :category, presence: true
end
