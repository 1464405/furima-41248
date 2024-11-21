FactoryBot.define do
  factory :user do
    name { Faker::Name.last_name }
    email { Faker::Internet.email }
    password { Faker::Internet.password(min_length: 6) + '1a' }
    password_confirmation { password }
    last_name { '山崎' }
    first_name { '駿' }
    last_name_kana { 'ヤマザキ' }
    first_name_kana { 'シュン' }
    birthday { '1994-07-13' }
  end
end
