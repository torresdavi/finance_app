# frozen_string_literal: true

class AddYearToIncomes < ActiveRecord::Migration[7.1]
  def change
    add_column :incomes, :year, :integer
  end
end
