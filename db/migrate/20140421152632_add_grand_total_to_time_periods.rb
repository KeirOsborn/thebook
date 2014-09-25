class AddGrandTotalToTimePeriods < ActiveRecord::Migration
  def change
    add_column :time_periods, :grand_total_in_pence, :integer
  end
end
