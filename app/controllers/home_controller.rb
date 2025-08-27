# frozen_string_literal: true

class HomeController < ApplicationController
  before_action :authenticate_user!

  def index; end

  def recommend_channels; end

  def feedbacks; end
end
