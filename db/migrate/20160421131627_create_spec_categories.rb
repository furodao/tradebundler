class CreateSpecCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :spec_categories do |t|
      t.string :title
    end
  end
end
