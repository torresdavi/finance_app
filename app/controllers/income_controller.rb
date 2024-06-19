# frozen_string_literal: true

class IncomeController < ApplicationController
  def new; end

  def create
    @income = Income.new(income_params)

    respond_to do |format|
      format.html do
        redirect_to root_path
      end
    end
  end

  private

  def income_params
    params.require(:income).permit(:monthly_income, :month)
  end
end
