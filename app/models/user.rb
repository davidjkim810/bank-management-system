class User < ApplicationRecord
  belongs_to :bank
  has_many :accounts
  has_many :transactions, through: :accounts
  has_secure_password
  validates :first_name, :last_name, :age, :street_address, :city, :state, :zip_code, :username, :email, :password, :bank_id, presence: true
  validates :username, :email, uniqueness: true
  validates :first_name, :last_name, :city, :state, format: { with: /\A[a-zA-Z]+\z/,
    message: "Only letters allowed" }
end
