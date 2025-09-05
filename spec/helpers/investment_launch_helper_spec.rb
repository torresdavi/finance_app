# frozen_string_literal: true

# frozen_literal_string
require 'rails_helper'

RSpec.describe InvestmentLaunchHelper, type: :helper do
  describe 'asset_types' do
    it 'should return assets collection translated to PT-BR' do
      expect(helper.asset_types).to contain_exactly(
        ['Criptomoeda', 0], ['ETF Internacional', 1], ['ETF Nacional', 2],
        ['Ações', 3], ['Tesouro Direto', 4], ['Fundo Imobiliário', 5],
        ['Dólar', 6]
      )
    end
  end

  describe 'order_types' do
    it 'should return order types collection translated to PT-BR' do
      expect(helper.order_types).to contain_exactly(
        ['Venda', 0], ['Compra', 1]
      )
    end
  end

  describe 'coin_types' do
    it 'should return coin types collection translated to PT-BR' do
      expect(helper.coin_types).to contain_exactly(
        ['Real', 0], ['Dólar', 1]
      )
    end
  end
end
