# frozen_string_literal: true

class InvestmentLaunchesController < ApplicationController
  before_action :authenticate_user!
  before_action :investment_launch, only: %i[show update edit destroy]

  def index
    @investment_launches = InvestmentLaunch.where(user: current_user)
  end

  def show; end

  def new
    @investment_launch = InvestmentLaunch.new
  end

  def edit; end

  def create
    @investment_launch = InvestmentLaunch.new(investment_launch_params.merge(user: current_user))

    if @investment_launch.save
      flash[:notice] = 'Lançamento cadastrado com sucesso.'
      redirect_to investment_launches_path
    else
      render :new, status: 422
    end
  end

  def update
    if @investment_launch.update(investment_launch_params)
      flash[:notice] = 'Lançamento atualizado com sucesso.'
      redirect_to investment_launches_path
    else
      render :edit, status: 422
    end
  end

  def destroy
    if @investment_launch.destroy
      flash[:notice] = 'Lançamento excluído com sucesso.'
    else
      flash[:alert] = 'Não foi possível excluir o lançamento.'
    end
    redirect_to investment_launches_path
  end

  private

  def investment_launch
    @investment_launch = InvestmentLaunch.find(params[:id])
  end

  def investment_launch_params
    params.require(:investment_launch).permit(
      :asset_type, :coin_type, :asset_name, :order_type, :order_date, :order_total_value,
      :quantity, :unitary_price, :broker, :observation, :user_id
    )
  end
end
