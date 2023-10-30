FactoryBot.define do
  factory :user do
    nickname   { Faker::Name.initials }
    email      { Faker::Internet.free_email }
    password   { 'a1' + Faker::Internet.password(min_length: 6, mix_case: false) }
    password_confirmation { password }
    last_name   { 'やマ田' }
    first_name  { 'たロ宇' }
    last_name_kana  { 'ヤマダ' }
    first_name_kana { 'タロウ' }
    birth_date { Faker::Date.between(from: '1930-01-01', to: '2018-12-31') }
  end
end