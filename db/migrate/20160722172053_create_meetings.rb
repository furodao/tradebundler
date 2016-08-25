class CreateMeetings < ActiveRecord::Migration[5.0]
  def change
    create_table :meetings do |t|
      t.datetime :time
      t.string :place
      t.string :status
      t.integer :seller_id
      t.integer :buyer_id
    end
  end
end
