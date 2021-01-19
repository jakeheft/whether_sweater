FactoryBot.define do
  factory :user do
    email { Faker::Internet.email(domain: 'example') }
    password { Faker::Alphanumeric.alphanumeric(number: 10) }
    api_key { Faker::Alphanumeric.alphanumeric(number: 10) }
  end
end
