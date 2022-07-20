FactoryBot.define do
  factory :badge do
    name { 'name' }
    file { 'file' }
    rule_type { 'category' }
    rule_value { 'value' }

    trait :invalid do
      name { nil }
      file { nil }
    end
  end
end
