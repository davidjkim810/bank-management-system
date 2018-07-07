require 'rails_helper'

RSpec.describe Account, type: :model do

  let(:bank) {
    Bank.create(
      :name => "Flatiron Credit Union")
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
    Transaction.create(
      :type_of_transaction => "Deposit",
      :amount => 2500,
      :user_id => user.id,
      :account_id => account.id
    )
  }

  let(:transaction1) {
    Transaction.create(
      :type_of_transaction => "Withdrawal",
      :amount => 200,
      :user_id => user.id,
      :account_id => account.id
    )
  }

  let(:transaction2) {
    Transaction.create(
      :type_of_transaction => "Fee",
      :amount => 15,
      :user_id => user.id,
      :account_id => account.id
    )
  }

  it "creates a valid account" do
    expect(account).to be_valid
  end

  it "belongs to a single user" do
    expect(account.user).to eq(user)
  end

  it "has many transactions" do
    account.update(:transactions => [transaction, transaction1, transaction2])
    expect(account.transactions.count).to eq(3)
  end

  it "can have the balance deducted" do
    account.balance -= 2500
    expect(account.balance).to eq(2500)
  end

  it "can have a negative balance" do
    account.balance -= 5500
   expect(account.balance).to eq(-500)
  end


end
