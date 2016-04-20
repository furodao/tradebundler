class AddBudgetToSpecs < ActiveRecord::Migration[5.0]
  def change
    add_column :specs, :budget, :decimal
  end
end
