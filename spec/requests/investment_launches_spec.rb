# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'InvestmentLaunches', type: :request do
  include Devise::Test::IntegrationHelpers

  let!(:user) { create(:user) }
  let!(:investment_launch_1) { create(:investment_launch, asset_name: 'BBAS3', user:) }
  let!(:investment_launch_2) { create(:investment_launch, :sell, asset_name: 'PETR4', user:) }
  let!(:investment_launch_3) { create(:investment_launch, :dollar, asset_name: 'VALE3', user:) }

  before do
    sign_in user
  end

  describe 'GET /investment_launches' do
    it 'returns all investment launches of current user' do
      get investment_launches_path

      expect(response).to have_http_status(:ok)
      expect(response.body).to include('BBAS3')
      expect(response.body).to include('VALE3')
      expect(response.body).to include('PETR4')
    end
  end

  describe 'POST /investment_launches' do
    context 'with valid params' do
      it 'creates a new investment launch' do
        expect do
          post investment_launches_path, params: { investment_launch: {
            asset_name: 'BBAS3',
            asset_type: :stock_exchange_shares,
            coin_type: :brl,
            order_type: :buy,
            order_date: Date.today,
            quantity: 15,
            unitary_price: 10,
            order_total_value: 150,
            broker: 'BTG',
            user_id: user.id,
          } }
        end.to change(InvestmentLaunch, :count).by(1)

        expect(response).to redirect_to(investment_launches_url)
        expect(response).to have_http_status(:found)
        expect(InvestmentLaunch.last.asset_name).to eq('BBAS3')
      end
    end

    context 'with invalid params' do
      it 'do not create a new investment launch' do
        post investment_launches_path, params: { investment_launch: {
          asset_name: 'AÇÃO NÃO CRIADA',
          asset_type: :stock_exchange_shares,
          coin_type: :brl,
          order_type: :buy,
          order_date: nil,
          quantity: nil,
          unitary_price: 10,
          order_total_value: 150,
          broker: 'BTG',
          user_id: user.id,
        } }

        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.body).to include('Por favor, corrija os erros abaixo.')
        expect(response.body).to include('Data da Operação não pode ficar em branco')
        expect(response.body).to include('Quantidade não pode ficar em branco')
        expect(response.body).to include('Quantidade deve ser um número')
        expect(InvestmentLaunch.last.asset_name).not_to eq('AÇÃO NÃO CRIADA')
      end
    end
  end

  describe 'PATCH /investment_launches/[:id]' do
    context 'with valid params' do
      let(:new_attributes) { { asset_name: 'AÇÃO NOVA' } }

      it 'updates the investment launch' do
        patch investment_launch_url(investment_launch_1), params: { investment_launch: new_attributes }

        investment_launch_1.reload

        expect(response).to have_http_status(:found)
        expect(investment_launch_1.asset_name).to eq('AÇÃO NOVA')
        expect(investment_launch_1.updated_at).to be > investment_launch_1.created_at
      end
    end

    context 'with invalid params' do
      let(:new_attributes) { { asset_name: nil } }

      it 'does not update the investment launch' do
        patch investment_launch_url(investment_launch_2), params: { investment_launch: new_attributes }

        investment_launch_2.reload

        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.body).to include('Por favor, corrija os erros abaixo.')
        expect(response.body).to include('Ativo não pode ficar em branco')
        expect(investment_launch_2.asset_name).to eq('PETR4')
        expect(investment_launch_2.updated_at).to eq(investment_launch_2.created_at)
      end
    end
  end
end
