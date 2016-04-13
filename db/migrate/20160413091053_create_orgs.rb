class CreateOrgs < ActiveRecord::Migration[5.0]
  def change
    create_table :orgs do |t|
      t.integer :org_num
      t.string :title

      t.timestamps
    end
  end
end
