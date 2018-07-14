class User < ApplicationRecord
  belongs_to :bank
  has_many :accounts
  has_many :transactions, through: :accounts
  has_secure_password
  # validates :first_name, :last_name, :age, :street_address, :city, :state, :zip_code, :username, :email, :password, :bank_id, presence: true
  validates :username, :email, uniqueness: true
  validates :password, length: { minimum: 6, message: "Password must be at least 6 characters long"}
  validates :zip_code, numericality: {only_integer: true, message: "Only numbers allowed"}
  validates :zip_code, length: { is: 5 }
  validates :first_name, :last_name, format: { with: /\A[a-zA-Z]+\z/,
    message: "Only letters allowed" }
  validates :age, numericality: { greater_than_or_equal_to: 18, message: "18 is the minimum age to join this bank"}

  def bank_statement
  end

end
