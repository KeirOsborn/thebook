class Expense < ActiveRecord::Base
  belongs_to :housemate
  belongs_to :time_period

  

end
