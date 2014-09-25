class AddPerHousemateTotalToTimePeriods < ActiveRecord::Migration
  def change
    add_column :time_periods, :per_housemate_total_in_pence, :integer
  end
end
