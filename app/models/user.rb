class User < ApplicationRecord
  belongs_to :bank
  has_many :accounts
  has_many :transactions, through: :accounts

end
