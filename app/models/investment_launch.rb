# frozen_string_literal: true

# frozen_literal_string

class InvestmentLaunch < ApplicationRecord
  belongs_to :user

  # Enums
  enum :asset_type, %i[
    criptocoin international_etf national_etf stock_exchange_shares
    direct_treasury real_estate_fund dollar
  ]

  enum :order_type, %i[sell buy]

  enum :coin_type, %i[brl usd]

  # Validations
  validates :asset_type, :coin_type, :asset_name, :order_type, :order_date, :order_total_value,
            :quantity, :unitary_price, :broker, presence: true

  validates :order_total_value, :quantity, :unitary_price, numericality: { greater_than: 0 }
end
