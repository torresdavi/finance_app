class CreateIncomes < ActiveRecord::Migration[7.1]
  def change
    create_table :incomes do |t|
      t.float :monthly_income
      t.integer :month
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
