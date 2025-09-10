# frozen_string_literal: true

FactoryBot.define do
  factory :investment_launch do
    asset_name { ['BBAS3', 'PETR4', 'VALE3'].sample }
    asset_type { :stock_exchange_shares }
    coin_type { :brl }
    order_type { :buy }
    order_date { Date.today }
    quantity { 15 }
    unitary_price { 10 }
    order_total_value { 150 }
    broker { 'BTG' }

    trait :sell do
      order_type { :sell }
    end

    trait :dollar do
      coin_type { :usd }
    end
  end
end
