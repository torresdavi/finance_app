# frozen_string_literal: true

class HomeController < ApplicationController
  before_action :authenticate_user!
  def index
    @goal = Goal.find_by(user: current_user)
    @incomes = Income.includes(:user).where(user: current_user)
    @expenses = Expense.includes(:user).where(user: current_user)

    @budget_service = BudgetService.new(current_user)

    @budget_costs = @budget_service.calculate_costs
    @budget_remaining_balances = @budget_service.calculate_remaining_balances
    @budget_utilized_percentage = @budget_service.calculate_utilized_percentages
    @budget_total_percentage = @budget_service.calculate_total_percentage
  end

  def recommend_channels; end

  def feedbacks; end
end
