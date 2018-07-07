class Account < ApplicationRecord
  belongs_to :user
  has_many :transactions
  validates :type_of_account, inclusion: { in: %w(checking savings investment), message: "#{value} is not a valid account type."}

end
