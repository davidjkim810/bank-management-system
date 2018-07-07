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

  it "creates a valid user with first_name, last_name, street_address, city, state, zip_code, username, email, password and bank" do
    expect(user).to be_valid
  end

  it "belongs to one bank" do
    expect(user.bank).to eq(bank)
  end

end
