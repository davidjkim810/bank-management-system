require 'rails_helper'

RSpec.describe Bank, type: :model do
  let(:bank) {
    Bank.create(
      :name => "The Flatiron Credit Union"
    )
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

  let(:user2) {
    User.create(
      :first_name => "Jane",
      :last_name => "Doe",
      :street_address => "284 Flatiron Way",
      :city => "Winterland",
      :state => "NY",
      :zip_code => "07854",
      :username => "JaneDoe123",
      :email => "JaneDoe@gmail.com",
      :password => "abc124",
      :bank_id => bank.id
    )
  }

  let(:user3) {
    User.create(
      :first_name => "Joseph",
      :last_name => "Kage",
      :street_address => "10 Flatiron Way",
      :city => "Funland",
      :state => "NH",
      :zip_code => "07814",
      :username => "JoeKage",
      :email => "JoeKage@gmail.com",
      :password => "abc12a",
      :bank_id => bank.id
    )
  }

  it "is valid with a name" do
    expect(bank).to be_valid
  end

  it "has many users" do
    bank.users << user
    bank.users << user2
    bank.users << user3
    expect(bank.users.count).to eq (3)
  end


end
