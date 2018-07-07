class User < ApplicationRecord
  belongs_to :bank
  has_many :accounts
  has_many :transactions, through: :accounts
  has_secure_password
  validates :first_name, :last_name, :city, :state, format: { with: /\A[a-zA-Z]+\z/,
    message: "Only letters allowed" }
end
