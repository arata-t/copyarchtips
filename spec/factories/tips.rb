FactoryBot.define do
  factory :tip do
    title            { Faker::Lorem.sentence }
    category_id      { 2 }
    image            { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/test_image.png')) }
    description      { Faker::Lorem.sentence }
    association :user
  end
end
