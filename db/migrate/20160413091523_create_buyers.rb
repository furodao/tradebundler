class CreateBuyers < ActiveRecord::Migration[5.0]
  def change
    create_table :buyers do |t|
      t.string :first_name
      t.string :last_name
      t.string :phone
      t.integer :org_id

      t.timestamps
    end
  end
end
