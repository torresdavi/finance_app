# frozen_string_literal: true

module ExpenseHelper
  def categories_for_select
    Expense.categories.keys
  end
end
