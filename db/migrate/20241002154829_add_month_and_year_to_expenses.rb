class AddMonthAndYearToExpenses < ActiveRecord::Migration[7.1]
  def change
    add_column :expenses, :month, :integer
    add_column :expenses, :year, :integer
  end
end
