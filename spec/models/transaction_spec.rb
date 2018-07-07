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

  let(:transaction) {
    Transaction.create(:type => "Checking", :amount => 3500, :user_id => user.id)
  }

end
