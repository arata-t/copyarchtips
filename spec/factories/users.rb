FactoryBot.define do
  factory :user do
    nickname              { 'test' }
    email                 { Faker::Internet.free_email }
    password              { Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    last_name             { '田中' }
    first_name            { '太郎' }
    introduction          { Faker::Lorem.sentence }
  end
end
