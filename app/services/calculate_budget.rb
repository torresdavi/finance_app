# CalculateBudget é responsável por calcular a soma dos gastos por categoria
# e determinar o saldo restante com base na receita atual e nas metas definidas pelo usuário.
class CalculateBudget
  CATEGORIES = %w[
    fixed_cost
    comfort
    goals
    pleasures
    financial_freedom
    knowledge
  ].freeze

  def initialize(current_user)
    @current_user = current_user
    @month = Date.current.month
    @year = Date.current.year
    @current_income ||= @current_user.incomes.where(month: @month, year: @year).first.monthly_income
  end

  def sum_for_category(category)
    return unless CATEGORIES.include?(category)

    @current_user.expenses.where(category:).pluck(:expense_value).sum.round(2)
  end

  CATEGORIES.each do |category|
    define_method("sum_#{category}") do
      sum_for_category(category)
    end

    define_method("provisioned_balance_for_#{category}") do
      @current_income * @current_user.goal.send(category) / 100
    end

    define_method("remaining_balance_for_#{category}") do
      provisioned_balance = send("provisioned_balance_for_#{category}")
      (provisioned_balance - send("sum_#{category}")).round(2)
    end

    define_method("utilized_percentage_for_#{category}") do
      sum = send("sum_#{category}")
      provisioned_balance = send("provisioned_balance_for_#{category}")
      (sum.to_f / provisioned_balance * 100).round(2)
    end

    define_method("total_percentage_for_#{category}") do
      sum = send("sum_#{category}")
      (sum.to_f / @current_income * 100).round(2)
    end
  end
end
