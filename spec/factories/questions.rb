FactoryBot.define do
  factory :question do
    title { Faker::Lorem.words }
    category_id { 2 }
    description { Faker::Lorem.sentence }
    association :user
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.jpg'), filename: 'test_image.jpg')
    end
  end
end
