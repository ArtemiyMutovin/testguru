FactoryBot.define do
  factory :question do
    title { 'Question1' }
    test_id { create(:test).id }
  end
end
