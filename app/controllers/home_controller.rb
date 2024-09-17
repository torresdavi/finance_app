# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    redirect_to new_user_session_path unless current_user

    @goal = Goal.find_by(user: current_user)
    @income = Income.find_by(user: current_user)
  end
end
