class Housemate < ActiveRecord::Base
  has_many :expenses
  has_many :reimbursements
  has_many :time_periods, :through => :expenses
end

