FactoryBot.define do
  factory :item do
    name { 'iPhone' }
    explanation { 'grass' }
    category_id { 2 }
    situation_id { 2 }
    delivery_id { 2 }
    prefecture_id { 2 }
    day_id { 2 }
    sales_price { 500 }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
