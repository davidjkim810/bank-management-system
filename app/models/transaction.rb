class Transaction < ApplicationRecord
  belongs_to :user
  belongs_to :account
  validates :type_of_transaction, :amount, :user_id, :account_id, presence: true
  validates :amount, numericality:  { greater_than: 0, message: "The minimum transaction amount is $1."}
  validates :type_of_transaction, inclusion: { in: %w(Deposit Withdrawal Fee), message: "You must enter a valid transaction type. Choose from the following; 'Deposit', 'Withdrawal', 'Fee'"}


  def process_transaction

    if self.type_of_transaction == "Deposit" && !self.processed
      self.account.update(:balance => account.balance + self.amount)
      self.update(:processed => true)

      "You have successfully deposited #{self.amount}."

    elsif self.type_of_transaction == "Withdrawal" && !self.processed
      self.account.update(:balance => account.balance - self.amount)
      self.update(:processed => true)

      "You have successfully withdrawn #{self.amount}."
    elsif self.type_of_transaction == "Fee" && !self.processed
      self.account.update(:balance => account.balance - self.amount)
      self.update(:processed => true)

      "You have successfully paid the fee of #{self.amount}"
    end
  end

  def processed?
   if self.processed
     "Yes"
   else
     "No"
   end
 end
end
