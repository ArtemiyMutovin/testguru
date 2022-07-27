FactoryBot.define do
  factory :link do
    factory :google_link do
      name { 'Google' }
      url { 'https://google.com' }
    end

    factory :gist_link, class: 'Link' do
      name { 'Gist' }
      url { 'https://gist.github.com/ArtemiyMutovin/1bb0838d84e93bce0cb53464d0f4bd19' }
    end
  end
end
