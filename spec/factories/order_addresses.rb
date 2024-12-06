FactoryBot.define do
  factory :order_address do
    transient do
      user { FactoryBot.create(:user) }
      item { FactoryBot.create(:item) }
    end
    token             { 'tok_abcdefghijk00000000000000000' }
    post_code         { '000-0000' }
    prefecture_id     { rand(2..48) }
    town              { Faker::Lorem.word }
    street_address    { Faker::Lorem.word }
    building          { Faker::Lorem.word }
    telephone_number  { '09012341234' }
    user_id           { user.id }
    item_id           { item.id }
  end
end
