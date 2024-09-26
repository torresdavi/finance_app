# frozen_string_literal: true

class User < ApplicationRecord
  has_one :goal
  has_many :expenses
  has_many :incomes
  after_create :create_goals
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def create_goals
    Goal.create!(user_id: id, fixed_cost: 30, comfort: 15, goals: 10, pleasures: 10, financial_freedom: 30,
                 knowledge: 5)
  end
end
