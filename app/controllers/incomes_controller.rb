# frozen_string_literal: true

class IncomesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  before_action :income, only: [:edit, :update]

  def index
    @incomes = Income.where(user_id: current_user)
  end

  def new
    @income = Income.new
  end

  def edit; end

  def create
    @income = Income.new(income_params.merge(user: current_user))

    if @income.save
      flash[:notice] = 'Renda salva com sucesso!'
      redirect_to incomes_path
    else
      flash[:alert] = @income.errors.full_messages.join(', ')
      render :new
    end
  end

  def update
    if @income.update(income_params)
      flash[:notice] = 'Renda salva com sucesso!'
      redirect_to root_path
    else
      flash[:alert] = @income.errors.full_messages.join(', ')
      render :edit
    end
  end

  private

  def income
    @income ||= Income.find(params[:id])
  end

  def income_params
    params.require(:income).permit(:monthly_income, :month, :year)
  end
end
