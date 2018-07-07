class Account < ApplicationRecord
  belongs_to :user
  has_many :transactions
  validates :type_of_account, :balance, :user_id, presence: true
  validates :type_of_account, inclusion: { in: %w(Checking Savings Investment), message: "You must enter a valid account type."}
  validates :balance, numericality: { greater_than_or_equal_to: 0, message: "Your starting balance cannot be less than 0 dollars."}, on: :create

end
