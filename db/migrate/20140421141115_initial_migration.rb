class InitialMigration < ActiveRecord::Migration
  def up
  	create_table :housemates do |t|
  		t.string :name

  		t.timestamps
  	end

  	create_table :time_periods do |t|
  		t.string :name

  		t.timestamps
  	end

  	create_table :expenses do |t|
  		t.belongs_to :housemate
  		t.belongs_to :time_period
  		t.integer :amount_in_pence

  		t.timestamps
  	end

  	create_table :reimbursements do |t|
  		t.belongs_to :housemate
  		t.belongs_to :time_period
  		t.integer :amount_in_pence

  		t.timestamps
  	end

  end

  def down

  	drop_table :reimbursements

  	drop_table :expenses

  	drop_table :time_periods

  	drop_table :housemates
  	
  end
end
