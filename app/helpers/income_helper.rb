# frozen_string_literal: true

module IncomeHelper
  MONTHS = {
    1 => 'Janeiro',
    2 => 'Fevereiro',
    3 => 'Março',
    4 => 'Abril',
    5 => 'Maio',
    6 => 'Junho',
    7 => 'Julho',
    8 => 'Agosto',
    9 => 'Setembro',
    10 => 'Outubro',
    11 => 'Novembro',
    12 => 'Dezembro'
  }.freeze

  def month_integer_to_string(month)
    MONTHS[month] || 'Mês inválido'
  end
end
