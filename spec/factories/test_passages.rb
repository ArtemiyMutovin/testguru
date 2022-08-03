FactoryBot.define do
  factory :test_passage do
    correct_questions { 1 }
    test_id { create(:test).id }
    user_id { create(:user).id }

    trait :failed do
      correct_questions { 0 }
    end
  end
end
