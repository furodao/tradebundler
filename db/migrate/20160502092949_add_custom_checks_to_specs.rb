class AddCustomChecksToSpecs < ActiveRecord::Migration[5.0]
  def change
    add_column :specs, :custom_checks, :jsonb, null: false, default: '[]'
    add_index :specs, :custom_checks, using: :gin
  end

  def down
    remove_column :specs, :custom_checks
  end
end
