# frozen_string_literal: true

module InvestmentLaunchHelper
  def asset_types
    InvestmentLaunch.asset_types.keys.map do |key|
      [t("activerecord.enums.investment_launch.asset_types.#{key}"), key]
    end
  end

  def order_types
    InvestmentLaunch.order_types.keys.map do |key|
      [t("activerecord.enums.investment_launch.order_types.#{key}"), key]
    end
  end

  def coin_types
    InvestmentLaunch.coin_types.keys.map do |key|
      [t("activerecord.enums.investment_launch.coin_types.#{key}"), key]
    end
  end
end
