# This will guess the User class
FactoryBot.define do
  factory :target do
    topic     { Faker::Book.genre }
    length    { Faker::Number.between(100, 1000) }
    title     { Faker::Friends.character }
    latitude  { Faker::Address.latitude }
    longitude { Faker::Address.longitude }
    user      { create :user }
  end

  factory :invalid_target do
    country   { Faker::Address.country }
    topic     { Faker::Book.genre }
    length    { Faker::Number.between(100, 1000) }
    title     { Faker::Friends.character }
    latitude  { Faker::Address.latitude }
    longitude { Faker::Address.longitude }
    user
  end
end
