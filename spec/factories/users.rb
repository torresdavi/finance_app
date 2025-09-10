# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    name { ['Davi', 'Luiz', 'André'].sample }
    email { 'test@email.com' }
    password { '123456' }
  end
end
