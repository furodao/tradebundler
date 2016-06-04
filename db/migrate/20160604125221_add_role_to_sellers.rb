class AddRoleToSellers < ActiveRecord::Migration[5.0]
  def change
    add_column :sellers, :role, :string
  end
end
