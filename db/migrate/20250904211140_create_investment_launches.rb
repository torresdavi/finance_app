# frozen_string_literal: true

class CreateInvestmentLaunches < ActiveRecord::Migration[7.1]
  def change
    create_table :investment_launches do |t|
      t.integer :asset_type, null: false
      t.integer :coin_type, null: false, default: 0
      t.string :asset_name, null: false
      t.integer :order_type, null: false
      t.date :order_date, null: false
      t.float :quantity, null: false
      t.float :unitary_price, null: false
      t.float :order_total_value, null: false
      t.string :broker, null: false
      t.text :observation
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
