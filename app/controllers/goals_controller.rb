# frozen_string_literal: true

class GoalsController < ApplicationController
  before_action :authenticate_user!, only: %i[new create]

  def index;end

  def new; end

  def edit; end

  def create
    @goal = Goal.new(goal_params.merge(user: current_user))

    respond_to do |format|
      if @goal.save
        format.html do
          redirect_to goals_path
        end
      else
        format.html do
          redirect_to goals_path
        end
      end
    end
  end

  def update
    respond_to do |format|
      if @goal.update(goal_params)
        format.html do
          redirect_to root_path
        end
      end
    end
  end

  private

  def goal
    @goal ||= Goal.find(params[:id])
  end

  def goal_params
    params.permit(:fixed_cost, :comfort, :goals, :pleasures, :financial_freedom, :knowledge)
  end
end