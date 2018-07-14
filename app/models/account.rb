class Account < ApplicationRecord
  belongs_to :user
  has_many :transactions
  validates :type_of_account, :balance, :user_id, presence: true
  validates :type_of_account, inclusion: { in: %w(Checking Savings Retirement), message: "You must enter a valid account type."}
  validates :balance, numericality: { greater_than_or_equal_to: 0, message: "Your starting balance cannot be less than 0 dollars."}, on: :create

  def self.types_for_form
    %w[Checking Savings Retirement]
  end

  # def transaction_history
  #   self.transactions.each_with_index do |transaction, i|
  #     puts "Transaction Number: #{i+1} | Type of Transaction: #{transaction.type_of_transaction} | Amount: #{transaction.amount} | Processed: #{transaction.processed?}"
  #   end
  # end

end
