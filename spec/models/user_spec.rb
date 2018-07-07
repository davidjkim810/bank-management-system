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
      :age => 19,
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

  it "belongs to one bank" do
    expect(user.bank).to eq(bank)
  end

  it "has many accounts" do
    user.update(:accounts => [account1, account2, account3])
      expect(user.accounts.count).to eq(3)
  end

  it "creates a valid user with first_name, last_name, street_address, age, city, state, zip_code, username, email, password and bank_id" do
    expect(user).to be_valid
  end


  it "must have a unique username" do
    user
    new_user = User.create(
          :first_name => "John",
          :last_name => "Doe",
          :street_address => "300 Flatiron Way",
          :age => 19,
          :city => "Wonderland",
          :state => "NJ",
          :zip_code => "07854",
          :username => "JohnDoe123",
          :email => "JohnDoee@gmail.com",
          :password => "abc123",
          :bank_id => bank.id
        )
    expect(new_user).to be_invalid
  end

  it "must have a unique email" do
    user
    new_user = User.create(
          :first_name => "John",
          :last_name => "Doe",
          :street_address => "300 Flatiron Way",
          :age => 19,
          :city => "Wonderland",
          :state => "NJ",
          :zip_code => "07854",
          :username => "JohnDoe123a",
          :email => "JohnDoe@gmail.com",
          :password => "abc123",
          :bank_id => bank.id
        )
    expect(new_user).to be_invalid
  end

  it "minimum age to create account is 18" do
    user.update(:age => 15)
    expect(user).to be_invalid
  end

  it "must have a password that is at least 6 characters long" do
    user.update(:password => "adsf")
    expect(user).to be_invalid
  end

  it "first_name, last_name, city, can only have letters" do
    user.update(:first_name => "David1")
    expect(user).to be_invalid
  end

  it "zip_code can only be numbers" do
    user.update(:zip_code => "da233")
    expect(user).to be_invalid
  end

  it "zip_code must be 5 digits" do
    user.update(:zip_code => "2444")
    expect(user).to be_invalid
  end

  it "has many transactions through accounts" do
    user.update(:accounts => [account1, account2, account3])
    new_transaction = Transaction.create(:type_of_transaction => "Deposit", :amount => 60000, :user_id => user.id, :account_id => user.accounts.first.id)
    Transaction.create(:type_of_transaction => "Withdrawal", :amount => 1000, :user_id => user.id, :account_id => user.accounts.last.id)
    expect(user.transactions.count).to eq(2)
  end
end
