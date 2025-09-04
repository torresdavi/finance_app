# frozen_string_literal: true

class GoalsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  before_action :goal, only: [:edit, :update]

  def index
    @goal = Goal.find_by(user: current_user)
  end

  def new
    @goal = Goal.new
  end

  def edit; end

  def create
    @goal = current_user.goals.build(goal_params)

    if @goal.save
      flash[:notice] = 'Metas salvas com sucesso!'
      redirect_to root_path
    else
      flash[:alert] = @goal.errors.full_messages.join(', ')
      render :new
    end
  end

  def update
    respond_to do |format|
      if @goal.update(goal_params)
        format.html do
          flash[:notice] = 'Metas salvas com sucesso!'
          redirect_to new_goal_path
        end
      else
        format.html do
          flash[:alert] = @goal.errors.full_messages.join(', ')
          render :edit
        end
      end
    end
  end

  private

  def goal
    @goal ||= Goal.find(params[:id])
  end

  def goal_params
    params.require(:goal).permit(:fixed_cost, :comfort, :goals, :pleasures, :financial_freedom, :knowledge)
  end
end
