# frozen_string_literal: true

module ApplicationHelper
  include ActiveSupport::NumberHelper

  def format_to_br_date(unformated_date)
    return unless unformated_date

    unformated_date.strftime('%d/%m/%Y')
  end

  def format_to_brl(value)
    return unless value

    number_to_currency(value, unit: 'R$ ', precision: 2, delimiter: '.', separator: ',')
  end

  def format_to_usd(value)
    return unless value

    number_to_currency(value, unit: '$ ', precision: 2, delimiter: '.', separator: ',')
  end
end
