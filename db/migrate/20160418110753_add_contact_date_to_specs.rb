class AddContactDateToSpecs < ActiveRecord::Migration[5.0]
  def change
    add_column :specs, :contact_date, :date
  end
end
