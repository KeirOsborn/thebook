class DropHousemates < ActiveRecord::Migration
  def up
  	drop_table :housemates 
  end

  def down
  end
end
