FactoryBot.define do
    factory :hero do |f|
      name { Faker::Lorem.word }
      status { Faker::Internet.user_name(10..10) }
    end
end