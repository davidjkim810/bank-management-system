require 'rails_helper'

RSpec.describe User, type: :model do

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

  let(:account1) {
    Account.create(
      :type_of_account => "Checking",
      :balance => 5000,
      :user_id => user.id)
  }

  let(:account2) {
    Account.create(
      :type_of_account => "Savings",
      :balance => 10000,
      :user_id => user.id)
  }

  let(:account3) {
    Account.create(
      :type_of_account => "Investment",
      :balance => 500000,
      :user_id => user.id)
  }

  let(:transaction1) {
    Transaction.create(:type_of_transaction => "Deposit", :amount => 3500, :user_id => user.id, :account_id => account.id)
  }

  let(:transaction2) {
    Transaction.create(:type_of_transaction => "Deposit", :amount => 100, :user_id => user.id, :account_id => account.id)
  }

  let(:transaction3) {
    Transaction.create(:type_of_transaction => "Deposit", :amount => 60000, :user_id => user.id, :account_id => account.id)
  }



  it "creates a valid user with first_name, last_name, street_address, city, state, zip_code, username, email, password and bank" do
    expect(user).to be_valid
  end

  it "belongs to one bank" do
    expect(user.bank).to eq(bank)
  end

  it "has many accounts" do
    user.update(:accounts => [account1, account2, account3])
      expect(user.accounts.count).to eq(3)
  end

  it "has many transactions through accounts" do

    user.update(:accounts => [account1, account2, account3])
    new_transaction = Transaction.create(:type_of_transaction => "Deposit", :amount => 60000, :user_id => user.id, :account_id => user.accounts.first.id)
    Transaction.create(:type_of_transaction => "Withdrawal", :amount => 1000, :user_id => user.id, :account_id => user.accounts.last.id)
    expect(user.transactions.count).to eq(2)
  end
end
