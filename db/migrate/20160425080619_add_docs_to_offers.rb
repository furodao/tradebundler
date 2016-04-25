class AddDocsToOffers < ActiveRecord::Migration[5.0]
  def change
    add_column :offers, :docs, :json
  end
end
