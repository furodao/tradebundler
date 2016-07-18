class CreateContracts < ActiveRecord::Migration[5.0]
  def change
    create_table :contracts do |t|
      t.integer :seller_org_id
      t.integer :buyer_org_id
      t.integer :offer_id
      t.integer :spec_id
    end
  end
end
