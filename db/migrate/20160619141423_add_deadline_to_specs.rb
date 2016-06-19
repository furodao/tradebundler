class AddDeadlineToSpecs < ActiveRecord::Migration[5.0]
  def change
    add_column :specs, :deadline, :datetime
  end
end
