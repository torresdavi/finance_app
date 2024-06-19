# frozen_string_literal: true

class Income < ApplicationRecord
  belongs_to :user

  validates :monthly_income, :month, presence: true
end
