# frozen_string_literal: true

class InvestmentLaunch < ApplicationRecord
  belongs_to :user

  # Enums
  enum asset_type: {
    criptocoin: 0, international_etf: 1, national_etf: 2, stock_exchange_shares: 3,
    direct_treasury: 4, real_estate_fund: 5, dollar: 6,
  }

  enum order_type: { sell: 0, buy: 1 }

  enum coin_type: { brl: 0, usd: 1 }

  # Validations
  validates :asset_type, :coin_type, :asset_name, :order_type, :order_date, :order_total_value,
            :quantity, :unitary_price, :broker, presence: true

  validates :order_total_value, :quantity, :unitary_price, numericality: { greater_than: 0 }
end
