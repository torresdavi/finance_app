# frozen_string_literal: true

class GoalsController < ApplicationController
  before_action :authenticate_user!, only: %i[new create]
  before_action :goal, only: %i[edit]

  def index
    @goal = Goal.find_by(user: current_user)
  end

  def new; end

  def edit; end

  def create
    @goal = Goal.new(goal_params.merge(user: current_user))

    respond_to do |format|
      if @goal.save
        format.html do
          flash[:notice] = 'Metas salvas com sucesso!'
          redirect_to new_goal_path
        end
      else
        format.html do
          flash[:alert] = @goal.errors.messages[:base][0]
          redirect_to new_goal_path
        end
      end
    end
  end

  def update
    respond_to do |format|
      if @goal.save
        format.html do
          flash[:notice] = 'Metas salvas com sucesso!'
          redirect_to new_goal_path
        end
      else
        format.html do
          flash[:alert] = @goal.errors.messages[:base][0]
          redirect_to new_goal_path
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
