FactoryBot.define do
  factory :answer do
    title { 'Answer1' }
    question_id { create(:question).id }
    correct { false }

    trait :correct_answer do
      title { 'Answer2' }
      correct { true }
    end

    trait :invalid do
      title { nil }
    end
  end
end
