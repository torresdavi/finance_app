# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ApplicationHelper, type: :helper do
  describe '#format_to_br_date' do
    context 'when date is present' do
      it 'formats the date to BR pattern' do
        expect(helper.format_to_br_date(Date.new(2025, 4, 30))).to eq('30/04/2025')
      end
    end

    context 'when date is not present' do
      it 'returns nil' do
        expect(helper.format_to_br_date(nil)).to be_nil
      end
    end
  end

  describe '#format_to_brl' do
    context 'when value is present' do
      it 'returns the value formated to BR Real' do
        expect(helper.format_to_brl(1250.34)).to eq('R$ 1.250,34')
      end
    end

    context 'when value is not present' do
      it 'returns nil' do
        expect(helper.format_to_brl(nil)).to be_nil
      end
    end
  end

  describe '#format_to_usd' do
    context 'when value is present' do
      it 'returns the value formated to US Dollar' do
        expect(helper.format_to_usd(1250.34)).to eq('$ 1.250,34')
      end
    end

    context 'when value is not present' do
      it 'returns nil' do
        expect(helper.format_to_usd(nil)).to be_nil
      end
    end
  end
end
