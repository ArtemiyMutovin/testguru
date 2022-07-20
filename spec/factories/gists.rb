FactoryBot.define do
  factory :gist do
    user_id { create(:user).id }
    question_id { create(:question).id }
    gist_url { 'Gist' }
  end
end
