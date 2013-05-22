# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :payment do
    hacker nil
    amount "9.99"
    fee "9.99"
    charge_identifier "MyString"
    test_mode false
  end
end
