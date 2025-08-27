# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Income, type: :model do
  describe 'Validations' do
    it { should validate_presence_of(:monthly_income) }
    it { should validate_presence_of(:month) }
  end
end
