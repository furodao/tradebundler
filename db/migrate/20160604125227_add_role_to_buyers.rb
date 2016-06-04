class AddRoleToBuyers < ActiveRecord::Migration[5.0]
  def change
    add_column :buyers, :role, :string
  end
end
