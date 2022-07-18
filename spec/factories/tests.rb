FactoryBot.define do
  sequence :title do |n|
    "title#{n}"
  end

  factory :test do
    title
    level { 4 }
    category_id { create(:category).id }
    author_id { create(:user).id }

    trait :test_with_second_level do
      level { 2 }
    end

    trait :invalid do
      title { nil }
    end
  end
end
