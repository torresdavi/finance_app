# frozen_string_literal: true

require 'test_helper'

class GoalControllerTest < ActionDispatch::IntegrationTest
  test 'should get new' do
    get goal_new_url
    assert_response :success
  end

  test 'should get create' do
    get goal_create_url
    assert_response :success
  end

  test 'should get edit' do
    get goal_edit_url
    assert_response :success
  end

  test 'should get update' do
    get goal_update_url
    assert_response :success
  end
end
