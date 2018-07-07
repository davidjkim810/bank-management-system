require 'rails_helper'

RSpec.describe Transaction, type: :model do

  let(:bank) {
    Bank.create(:name => "Flatiron Credit Union")
  }

  let(:user) {
    User.create(
      :first_name => "John",
      :last_name => "Doe",
      :street_address => "300 Flatiron Way",
      :city => "Wonderland",
      :state => "NJ",
      :zip_code => "07854",
      :username => "JohnDoe123",
      :email => "JohnDoe@gmail.com",
      :password => "abc123",
      :bank_id => bank.id
    )
  }

  let(:account) {
    Account.create(
      :type_of_account => "Checking",
      :balance => 5000,
      :user_id => user.id)
  }

  let(:transaction) {
    Transaction.create(:type_of_transaction => "Deposit", :amount => 3500, :user_id => user.id, :account_id => account.id)
  }

  it "creates a valid transaction" do
    expect(transaction).to be_valid
  end

  it "is valid only if it has a valid type_of_transaction" do
    transaction.update(:type_of_transaction => "Transfer")
    expect(transaction).to be_invalid
  end

  it "belongs to a single user" do
    transaction.user
    expect(transaction.user).to eq(user)
  end

  it "belongs to a single account" do
    transaction.account
    expect(transaction.account).to eq(account)
  end

  it "amount must be at least $1" do
    transaction.update(:amount => 0)
    expect(transaction).to be_invalid
  end

  it "new transactions are not processed on creation" do
    expect(transaction.processed).to eq(false)
  end

  it "has a method called 'process_transaction' that applies a deposit to the balance of the account it belongs to" do
    transaction.update(:amount => 2500)
    transaction.process_transaction
    account = Account.find(transaction.account.id)
    expect(account.balance).to eq(7500)
    expect(transaction.processed).to eq(true)
  end

  it "has a method called 'process_transaction' that applies a withdrawal to the balance of the account it belongs to" do
    transaction.update(:type_of_transaction => "Withdrawal", :amount => 4000)
    transaction.process_transaction

    account = Account.find(transaction.account.id)
    expect(account.balance).to eq(1000)
    expect(transaction.processed).to eq(true)
  end

end
