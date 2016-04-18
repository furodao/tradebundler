class AddStatusToOffers < ActiveRecord::Migration[5.0]
  def change
    add_column :offers, :status, :string
  end
end
