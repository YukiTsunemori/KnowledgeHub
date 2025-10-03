FactoryBot.define do
  factory :employee do
    name { 'Alice' }
    sequence(:email) { |n| "tester#{n}@example.com" }
    password { 'alice1111' }
    confirmed_at { Date.today }
  end
end
