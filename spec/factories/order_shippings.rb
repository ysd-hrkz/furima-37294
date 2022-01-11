FactoryBot.define do
  factory :order_shipping do
    user_id { Faker::Number.non_zero_digit }
    item_id { Faker::Number.non_zero_digit }
    post_code { '123-4567' }
    shipping_area_id { Faker::Number.between(from: 2, to: 48) }
    city { Faker::Address.city }
    address { Faker::Address.street_address }
    building_name { Faker::Address.street_address }
    phone_num { '0312345678' }
    token { 'tok_abcdefghijk00000000000000000' }
  end
end
