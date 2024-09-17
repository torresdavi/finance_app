# frozen_string_literal: true

class CreateGoals < ActiveRecord::Migration[7.1]
  def change
    create_table :goals do |t|
      t.integer :fixed_cost
      t.integer :comfort
      t.integer :goals
      t.integer :pleasures
      t.integer :financial_freedom
      t.integer :knowledge
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
