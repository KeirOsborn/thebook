class TimePeriod < ActiveRecord::Base
  has_many :expenses
  has_many :reimbursements
  has_many :housemates, :through => :expenses, :uniq => true


  def total_amount
  	total = 0
  	self.expenses.each do |expense|
  	  total += expense.amount_in_pence
  	end
  	return total
  end

  def collect_total
  	self.grand_total_in_pence = total_amount
  end

  def what_each_housemate_should_pay
  	self.per_housemate_total_in_pence = total_amount / self.housemates.count
  end

  def what_housemate_has_actually_paid(housemate)
  		@housemate_total = 0 
  		period_expenses = housemate.expenses.where(:time_period_id => self.id)
  		period_expenses.each do |expense|
  			@housemate_total += expense.amount_in_pence
  		end
  	    return @housemate_total
  end

  def what_housemate_owes_or_is_owed(housemate)
  	if what_housemate_has_actually_paid(housemate) > what_each_housemate_should_pay
      @reimbursement = what_housemate_has_actually_paid(housemate) - what_each_housemate_should_pay
      puts "#{housemate.name} is owed #{@reimbursement}"
      @total_owed += @reimbursement
      @payers << housemate
    elsif what_housemate_has_actually_paid(housemate) < what_each_housemate_should_pay
  		@payment = what_each_housemate_should_pay - what_housemate_has_actually_paid(housemate)
  		puts "#{housemate.name} owes #{@payment}"   
      @total_to_pay += @payment
      @owers << housemate
  		#create_reimbursements(housemate)
  	else 
      puts "housemate is all square"
    end 			
  end

  def what_everybody_owes_or_is_owed
    @total_to_pay = 0
    @total_owed = 0
    @owers = []
    @payers = []
  	self.housemates.each do |housemate|
  		what_housemate_owes_or_is_owed(housemate)	
  	end
  end

  def total_to_pay
    @total_to_pay
  end

  def total_owed
    @total_owed
  end

  def get_owers
    @owers
  end

  def get_payers
    @payers
  end



  ##def create_reimbursements(housemate)
 	 ##reimbursement = Reimbursement.new 
 	 ##reimbursement.assign_attributes({ :housemate_id => "#{housemate.id}", :time_period_id => "#{self.id}", :amount_in_pence => "#{@payment}" })
   ##reimbursement.save
  ##end

  ##def total_reimbursements
   ## @total_to_pay = 0
    ##self.reimbursements.each do |reimbursement|
      ##@total_to_pay += reimbursement.amount_in_pence
    ##end
    ##@total_to_pay
  ##end


end
