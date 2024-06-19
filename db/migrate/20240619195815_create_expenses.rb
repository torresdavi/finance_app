# frozen_string_literal: true

class CreateExpenses < ActiveRecord::Migration[7.1]
  def change
    create_table :expenses do |t|
      t.string :name
      t.float :expense_value
      t.integer :category, default: 0
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
