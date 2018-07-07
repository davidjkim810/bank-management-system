class Transaction < ApplicationRecord
  belongs_to :user
  belongs_to :account
  validates :type_of_transaction, :amount, :user_id, :account_id, presence: true
  validates :amount, numericality:  { greater_than: 0, message: "The minimum transaction amount is $1."}, on: :create
  validates :type_of_transaction, inclusion: { in: %w(Deposit Withdrawal Fee), message: "You must enter a valid transaction name"}


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
