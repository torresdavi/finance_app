# frozen_string_literal: true

Rails.application.routes.draw do
  get 'expense/index'
  get 'expense/new'
  get 'expense/create'
  get 'expense/edit'
  get 'expense/update'
  get 'expense/delete'
  get 'goal/new'
  get 'goal/create'
  get 'goal/edit'
  get 'goal/update'

  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get 'up' => 'rails/health#show', as: :rails_health_check

  root to: 'home#index'

  resource :income

  # Defines the root path route ("/")
  # root "posts#index"
end
