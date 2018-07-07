require 'rails_helper'

RSpec.describe Bank, type: :model do
  let(:bank) {
    Bank.create(
      :name => "The Flatiron Credit Union"
    )
  }


  it "is valid with a name" do
    expect(bank).to be_valid
  end



end
