FactoryBot.define do
  factory :item do
    association :user

    item_name                   { Faker::Name.initials }
    item_info                   { Faker::Lorem.sentence }
    item_category_id            { '2' }
    item_sales_status_id        { '2' }
    item_shipping_fee_status_id { '2' }
    item_prefecture_id          { '2' }
    item_scheduled_delivery_id  { '2' }
    item_price                  {Faker::Number.between(from: 300, to: 9_999_999)}

    after(:build) do |message|
      message.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
