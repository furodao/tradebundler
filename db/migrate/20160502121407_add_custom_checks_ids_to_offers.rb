class AddCustomChecksIdsToOffers < ActiveRecord::Migration[5.0]
  def change
    add_column :offers, :custom_checks_ids, :string, array: true, default: []
  end
end
