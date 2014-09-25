class AddRecipientToReimbursements < ActiveRecord::Migration
  def change
    add_column :reimbursements, :recipient, :string
  end
end
