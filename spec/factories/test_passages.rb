FactoryBot.define do
  factory :test_passage do
    current_question_id { create(:question).id }
    correct_questions { 1 }
    test_id { create(:test).id }
    user_id { create(:user).id }
  end
end
