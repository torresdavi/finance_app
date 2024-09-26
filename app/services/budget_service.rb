class BudgetService
  attr_reader :budget_calculator

  def initialize(current_user)
    @budget_calculator = CalculateBudget.new(current_user)
  end

  def calculate_costs
    calculate_for_all_categories(:sum)
  end

  def calculate_remaining_balances
    calculate_for_all_categories(:remaining_balance_for)
  end

  def calculate_utilized_percentages
    calculate_for_all_categories(:utilized_percentage_for)
  end

  def calculate_total_percentage
    calculate_for_all_categories(:total_percentage_for)
  end

  private

  def calculate_for_all_categories(method_prefix)
    CalculateBudget::CATEGORIES.each_with_object({}) do |category, results|
      method_name = "#{method_prefix}_#{category}"
      results[category.to_sym] = budget_calculator.send(method_name)
    end
  end
end
