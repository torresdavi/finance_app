# frozen_string_literal: true

class Goal < ApplicationRecord
  belongs_to :user

  validates :fixed_cost, :comfort, :goals, :pleasures, :financial_freedom, :knowledge, presence: true
  validate :validate_sum

  private

  def validate_sum
    if fixed_cost + comfort + goals + pleasures + financial_freedom + knowledge > 100
      errors.add(:base, message: 'A soma das metas deve dar 100')
    end
  end
end
