# frozen_string_literal: true

require 'rails_helper'

RSpec.describe InvestmentLaunchHelper, type: :helper do
  describe 'asset_types' do
    it 'should return assets collection translated to PT-BR' do
      expect(helper.asset_types).to contain_exactly(
        ['Criptomoeda', 'criptocoin'],
        ['ETF Internacional', 'international_etf'],
        ['ETF Nacional', 'national_etf'],
        ['Ações', 'stock_exchange_shares'],
        ['Tesouro Direto', 'direct_treasury'],
        ['Fundo Imobiliário', 'real_estate_fund'],
        ['Dólar', 'dollar']
      )
    end
  end

  describe 'order_types' do
    it 'should return order types collection translated to PT-BR' do
      expect(helper.order_types).to contain_exactly(
        ['Venda', 'sell'], ['Compra', 'buy']
      )
    end
  end

  describe 'coin_types' do
    it 'should return coin types collection translated to PT-BR' do
      expect(helper.coin_types).to contain_exactly(
        ['Real R$', 'brl'], ['Dólar $', 'usd']
      )
    end
  end
end
