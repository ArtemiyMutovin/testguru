FactoryBot.define do
  factory :test do
    title { 'MyString' }
    level { 4 }
    category_id { create(:category).id }
    author_id { create(:user).id }
  end
end
