class CreateSpecs < ActiveRecord::Migration[5.0]
  def change
    create_table :specs do |t|
      t.integer :buyer_id
      t.string :title
      t.text :description

      t.timestamps
    end
  end
end
