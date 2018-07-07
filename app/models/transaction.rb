class Transaction < ApplicationRecord
  belongs_to :user
  belongs_to :account

  def process_transaction

    if self.type_of_transaction == "Deposit"
      self.account.update(:balance => account.balance + self.amount)
      self.update(:processed => true)

      "You have successfully deposited #{self.amount}."

    elsif self.type_of_transaction == "Withdrawal"
      self.account.update(:balance => account.balance - self.amount)
      self.update(:processed => true)

      "You have successfully withdrawn #{self.amount}."
    end


  end
end
