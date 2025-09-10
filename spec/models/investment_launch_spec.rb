# frozen_string_literal: true

require 'rails_helper'

RSpec.describe InvestmentLaunch, type: :model do
  describe 'Validations' do
    it { should validate_presence_of(:asset_type) }
    it { should validate_presence_of(:asset_name) }
    it { should validate_presence_of(:coin_type) }
    it { should validate_presence_of(:order_type) }
    it { should validate_presence_of(:order_date) }
    it { should validate_presence_of(:order_total_value) }
    it { should validate_presence_of(:quantity) }
    it { should validate_presence_of(:unitary_price) }
    it { should validate_presence_of(:broker) }

    it { should validate_numericality_of(:order_total_value) }
    it { should validate_numericality_of(:quantity) }
    it { should validate_numericality_of(:unitary_price) }
  end

  describe 'Enums' do
    describe 'Asset types' do
      it 'Should return all assets types' do
        expect(InvestmentLaunch.asset_types).to contain_exactly(
          ['criptocoin', 0], ['international_etf', 1], ['national_etf', 2], ['stock_exchange_shares', 3],
          ['direct_treasury', 4], ['real_estate_fund', 5], ['dollar', 6]
        )
      end
    end

    describe 'Order types' do
      it 'Should return all order types' do
        expect(InvestmentLaunch.order_types).to contain_exactly(
          ['sell', 0], ['buy', 1]
        )
      end
    end

    describe 'Coin types' do
      it 'Should return all coin types' do
        expect(InvestmentLaunch.coin_types).to contain_exactly(
          ['brl', 0], ['usd', 1]
        )
      end
    end
  end
end
