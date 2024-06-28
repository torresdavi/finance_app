# frozen_string_literal: true

class ExpensesController < ApplicationController
  before_action :authenticate_user!, only: %i[new create]

  def index
    @expenses = Expense.find_by(user_id: current_user.id)
  end

  def new; end

  def show; end

  def edit; end

  def create
    @expense = Expense.new(expense_params)

    respond_to do |format|
      format.html do
        redirect_to root_path
      end
    end
  end

  def update
    respond_to do |format|
      if @expense.update(expense_params)
        format.html do
          redirect_to root_path
        end
      end
    end
  end

  def destroy
    @expense.destroy

    respond_to do |format|
      format.html { redirect_to expenses_url, notice: 'Despesa apagada' }
    end
  end

  private

  def expense
    @expense = Expense.find(params[:id])
  end

  def expense_params
    params.require(:expense).permit(:name, :expense_value, :category)
  end
end
