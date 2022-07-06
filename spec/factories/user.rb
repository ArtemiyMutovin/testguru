FactoryBot.define do
  sequence :email do |n|
    "user#{n}@test"
  end

  factory :user do
    email
    password { '123456' }
    password_confirmation { '123456' }
    confirmed_at { Time.zone.now }

    trait :second_user do
      type { 'Admin' }
    end
  end
end
