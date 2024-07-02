# frozen_string_literal: true

class Goal < ApplicationRecord
  belongs_to :user

  validates :fixed_cost, :comfort, :goals, :pleasures, :financial_freedom, :knowledge, numericality: { in: 0..100 },
                                                                                       presence: true
  validate :validate_sum

  private

  def validate_sum
    return unless fixed_cost + comfort + goals + pleasures + financial_freedom + knowledge != 100

    errors.add(:base, message: 'A soma das metas deve ser igual a 100.')
  end
end
