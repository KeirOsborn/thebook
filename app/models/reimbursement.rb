class Reimbursement < ActiveRecord::Base
  belongs_to :housemate
  belongs_to :time_period

  attr_accessible :housemate_id, :time_period_id, :amount_in_pence 

  def get_to_average
	while self.amount_in_pence < self.time_period.per_housemate_total_in_pence
		self.amount_in_pence += 1
	end
	return self.amount_in_pence
  end

  ## do we actually want to get to the average at any point?

end