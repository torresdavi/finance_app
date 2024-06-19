class CreateGoals < ActiveRecord::Migration[7.1]
  def change
    create_table :goals do |t|
      t.integer :fixed_cost, default: 30
      t.integer :comfort, default: 15
      t.integer :goals, default: 10
      t.integer :pleasures, default: 10
      t.integer :financial_freedom, default: 30
      t.integer :knowledge, default: 5
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
