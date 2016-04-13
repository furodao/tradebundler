class CreateOffers < ActiveRecord::Migration[5.0]
  def change
    create_table :offers do |t|
      t.integer :seller_id
      t.integer :spec_id
      t.text :description
      t.decimal :budget
      t.date :delivery_date

      t.timestamps
    end
  end
end
