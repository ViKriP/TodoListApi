FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    password { 'test_pswd' }
    password_confirmation { 'test_pswd' }
  end
end
