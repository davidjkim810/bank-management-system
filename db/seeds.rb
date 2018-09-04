# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

bank_1 = Bank.create(name: "Bank of Freedom")
bank_2 = Bank.create(name: "Flatiron Credit Union")

stock_1 = Stock.create(company_name: "Apple", shares_available: 45000000)
stock_2 = Stock.create(company_name: "Target", shares_available: 5000000)
stock_3 = Stock.create(company_name: "Whole Foods", shares_available: 70000000)
stock_4 = Stock.create(company_name: "Dell", shares_available: 401230000)
stock_5 = Stock.create(company_name: "Blizzard", shares_available: 523000000)
stock_6 = Stock.create(company_name: "Walmart", shares_available: 2409850808)


DATA = {
  :user_keys =>
    ["bank_id", "first_name", "last_name", "street_address", "city", "state", "zip_code", "age", "username", "email", "password_digest"],
  :users => [
    [1, "Davey", "Jones", "1 Sea Street", "Ocean City", "Florida", "02384", 19, "daveyjones", "daveyjones@seamail.com", "password"],
    [1, "Janey", "Jones", "2 Sea Street", "Ocean City", "Florida", "02384", 18, "janeyjones", "janeyjones@seamail.com", "password"],
    [1, "Thomas", "Aquinas", "1 Animal Street", "Animal City", "Texas", "02403", 31, "thomasaquinas", "thomasaquinas@animail.com", "password"],
    [1, "John", "Calvin", "1 Theology Street", "Reformed City", "Massachussetts", "01934", 50, "calvinlovestheology", "calvin@reformed.com", "password"],
    [2, "Bill", "Gates", "1 Rich Street", "Gold City", "California", "03244", 50, "chaching", "chaching@money.com", "password"],
    [2, "Jacky", "Kim", "1 Pine Street", "Hillsdale", "New Jersey", "07623", 25, "jackykim", "jackykim@gmail.com", "password"]
  ],
  :account_keys =>
    ["type_of_account", "balance", "user_id"],
  :accounts => [
    ["Checking", 20000, 1],
    ["Savings", 40000, 1],
    ["Checking", 60000, 2],
    ["Checking", 40000, 3],
    ["Checking", 1000000, 5],
    ["Checking", 320000, 4],
    ["Checking", 880000, 6],
    ["Savings", 330000, 2],
    ["Savings", 430000, 5],
    ["Savings", 20000, 3],
    ["Savings", 60000, 4],
    ["Investment", 820333000, 5]
  ]
}

def main
  make_users
  make_accounts
end

def make_users
  DATA[:users].each do |user|
    new_user = User.new
    user.each_with_index do |attribute, i|
      new_user.send(DATA[:user_keys][i]+"=", attribute)
    end
    new_user.save
  end
end


def make_accounts
  DATA[:accounts].each do |account|
    new_account = Account.new
    account.each_with_index do |attribute, i|
      new_account.send(DATA[:account_keys][i]+"=", attribute)
    end
    new_account.save
  end
end

main
