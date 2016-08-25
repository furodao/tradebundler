class AddOfferIdToMeetings < ActiveRecord::Migration[5.0]
  def change
    add_column :meetings, :offer_id, :integer
  end
end
