FactoryBot.define do
  factory :answer do
    title { 'Answer1' }
    correct { false }
    question_id { create(:question).id }

    trait :correct_answer do
      correct { true }
    end
  end
end
