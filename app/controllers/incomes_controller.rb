# frozen_string_literal: true

class IncomesController < ApplicationController
  before_action :authenticate_user!, only: %i[new create]

  def new; end

  def edit; end

  def create
    @income = Income.new(income_params.merge(user: current_user))

    respond_to do |format|
      if @income.save
        format.html do
          flash[:notice] = 'Renda salva com sucesso!'
          redirect_to new_incomes_path
        end
      else
        format.html do
          flash[:alert] = @income.errors.messages[:base][0]
          redirect_to new_incomes_path
        end
      end
    end
  end

  def update
    respond_to do |format|
      if @income.save
        format.html do
          flash[:notice] = 'Renda salva com sucesso!'
          redirect_to new_incomes_path
        end
      else
        format.html do
          flash[:alert] = @income.errors.messages[:base][0]
          redirect_to new_incomes_path
        end
      end
    end
  end

  private

  def income
    @income ||= Income.find(params[:id])
  end

  def income_params
    params.permit(:monthly_income, :month)
  end
end
