class Goal < ApplicationRecord
  belongs_to :user

  validates :fixed_cost, :comfort, :goals, :pleasures, :financial_freedom, :knowledge, presence: true

end
