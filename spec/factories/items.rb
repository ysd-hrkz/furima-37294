FactoryBot.define do
  factory :item do
    association :user

    name { Faker::Name.name }
    price { Faker::Number.between(from: 300, to: 9_999_999) }
    description { Faker::Lorem.sentence }
    condition_id { Faker::Number.between(from: 2, to: 7) }
    category_id { Faker::Number.between(from: 2, to: 11) }
    shipping_area_id { Faker::Number.between(from: 2, to: 48) }
    shipping_fee_id { Faker::Number.between(from: 2, to: 3) }
    shipping_days_id { Faker::Number.between(from: 2, to: 3) }

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
