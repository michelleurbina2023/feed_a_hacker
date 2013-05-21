# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :hacker do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name}
    email { Faker::Internet.email }
    password { Faker::Lorem.characters(4)}
  end

  factory :invalid_hacker, parent: :hacker do
    first_name nil
    last_name nil
    email nil
    password nil
  end

end