# frozen_string_literal: true

class IncomesController < ApplicationController
  before_action :authenticate_user!, only: %i[new create]
  before_action :income, only: %i[edit update]

  def new
    @income = Income.new
  end

  def edit; end

  def create
    @income = Income.new(income_params.merge(user: current_user))

    respond_to do |format|
      if @income.save
        format.html do
          flash[:notice] = 'Renda salva com sucesso!'
          redirect_to root_path
        end
      else
        format.html do
          flash[:alert] = @income.errors.messages[:base][0]
          redirect_to new_income_path
        end
      end
    end
  end

  def update
    respond_to do |format|
      if @income.update(incomes_params)
        format.html do
          flash[:notice] = 'Renda salva com sucesso!'
          redirect_to new_incomes_path
        end
      else
        format.html do
          flash[:alert] = @income.errors.full_messages.join(', ')
          render :edit
        end
      end
    end
  end

  private

  def income
    @income ||= Income.find(params[:id])
  end

  def income_params
    params.permit(:monthly_income, :month, :year)
  end
end
