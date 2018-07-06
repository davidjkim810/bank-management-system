require 'rails_helper'

RSpec.describe User, type: :model do

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
      :password => "abc123"
    )
  }

  it "is valid with a first_name, last_name, street_address, city, state, zip_code, username, e-mail, and password" do
    expect(user).to be_valid
  end


end
