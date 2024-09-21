# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    redirect_to new_user_session_path unless current_user

    @goal = Goal.find_by(user: current_user)
    @incomes = Income.where(user: current_user)
    @expenses = Expense.where(user: current_user)
  end

  def recommend_channels; end

  def feedbacks; end
end
