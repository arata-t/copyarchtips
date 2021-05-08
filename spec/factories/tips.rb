FactoryBot.define do
  factory :tip do
    title            { Faker::Lorem.sentence }
    category_id      { 2 }
    description      { Faker::Lorem.sentence }
    association :user

    after(:build) do |tip|
      tip.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
