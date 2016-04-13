class CreateSellers < ActiveRecord::Migration[5.0]
  def change
    create_table :sellers do |t|
      t.string :first_name
      t.string :last_name
      t.string :phone
      t.string :email
      t.integer :org_id

      t.timestamps
    end
  end
end
