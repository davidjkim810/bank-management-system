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
      :age => 19,
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
      :age => 30,
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
      :age => 40,
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

  it "has a unique name" do
    bank = Bank.create(:name => "The Flatiron Credit Union")
    new_bank = Bank.new(:name => "The Flatiron Credit Union")
    expect(new_bank.save).to eq(false)
  end

  it "has many users" do
    bank.update(:users => [user, user2, user3])
    expect(bank.users.count).to eq (3)
  end



end
