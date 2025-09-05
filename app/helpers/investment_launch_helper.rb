# frozen_string_literal: true

module InvestmentLaunchHelper
  def asset_types
    InvestmentLaunch.asset_types.map do |key, value|
      [t("activerecord.enums.investment_launch.asset_types.#{key}"), value]
    end
  end

  def order_types
    InvestmentLaunch.order_types.map do |key, value|
      [t("activerecord.enums.investment_launch.order_types.#{key}"), value]
    end
  end

  def coin_types
    InvestmentLaunch.coin_types.map do |key, value|
      [t("activerecord.enums.investment_launch.coin_types.#{key}"), value]
    end
  end
end
