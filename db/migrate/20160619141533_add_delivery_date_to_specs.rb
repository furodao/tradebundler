class AddDeliveryDateToSpecs < ActiveRecord::Migration[5.0]
  def change
    add_column :specs, :delivery_date, :date
  end
end
