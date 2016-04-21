class AddSpecCategoryIdToSpecs < ActiveRecord::Migration[5.0]
  def change
    add_column :specs, :spec_category_id, :integer
  end
end
