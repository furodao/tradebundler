class CreateContacts < ActiveRecord::Migration[5.0]
  def change
    create_table :contacts do |t|
      t.integer :seller_id
      t.integer :buyer_id

      t.timestamps
    end
  end

  add_index :contacts, [ :seller_id, :buyer_id  ], unique: true
end
