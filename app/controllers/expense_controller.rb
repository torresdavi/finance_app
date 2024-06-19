class ExpenseController < ApplicationController
  def index
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def delete
  end

  private

  def expense_params
    params.require(:income).permit(:monthly_income, :month)
  end
end
