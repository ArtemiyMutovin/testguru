FactoryBot.define do
  factory :question do
    title { 'Question1' }
    test_id { create(:test).id }

    trait :invalid do
      title { nil }
    end
  end
end
