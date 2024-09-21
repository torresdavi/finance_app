# frozen_string_literal: true

module ExpenseHelper
  def categories_for_select
    Expense.categories.keys.map do |key|
      [I18n.t("models.expense.categories.#{key}"), key]
    end
  end
end
