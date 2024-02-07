FactoryBot.define do
  test_user = {
    :first_name => Faker::Name.first_name,
    :last_name => Faker::Name.last_name
  }
  factory :user do
    first_name { test_user[:first_name] }
    last_name { test_user[:last_name] }
    email { Faker::Internet.email(name: "#{test_user[:first_name]} #{test_user[:last_name]}") }
  end
end
