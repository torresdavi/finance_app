# frozen_string_literal: true

class GoalsController < ApplicationController
  before_action :authenticate_user!, only: %i[new create]

  def new; end

  def create; end

  def edit; end

  def update; end
end
