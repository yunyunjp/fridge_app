FactoryBot.define do
  factory :item do
    name             { Faker::Name.name }
    quantity         { 10 }
    purchase_date    { '2021-2-27' }
    expiration_date  { '2021-3-8' }
    memo             {Faker::Lorem.sentence}
    association :user
  
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end