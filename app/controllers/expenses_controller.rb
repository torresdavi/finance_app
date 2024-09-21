# frozen_string_literal: true

class ExpensesController < ApplicationController
  before_action :authenticate_user!, only: %i[new create]
  before_action :expense, only: %i[show edit update destroy]

  def index
    @expenses = Expense.where(user_id: current_user.id)
  end

  def new
    @expense = Expense.new
  end

  def show; end

  def edit; end

  def create
    @expense = Expense.new(expense_params.merge(user: current_user))

    respond_to do |format|
      if @expense.save
        format.html do
          flash[:notice] = 'Despesa cadastrada com sucesso!'
          redirect_to root_path
        end
      else
        format.html do
          flash[:alert] = @expense.errors.messages[:base][0]
          redirect_to new_expense_path
        end
      end
    end
  end

  def update
    respond_to do |format|
      if @expense.update(expense_params)
        format.html do
          flash[:notice] = 'Despesa atualizada com sucesso!'
          redirect_to root_path
        end
      else
        format.html do
          flash[:alert] = @expense.errors.full_messages.join(', ')
          render :edit
        end
      end
    end
  end

  def destroy
    @expense = Expense.find(params[:id])
    @expense.destroy

    respond_to do |format|
      format.html { redirect_to root_path, notice: 'Despesa apagada' }
    end
  end

  private

  def expense
    @expense ||= Expense.find(params[:id])
  end

  def expense_params
    params.require(:expense).permit(:name, :expense_value, :category)
  end
end
