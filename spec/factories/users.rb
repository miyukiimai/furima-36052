FactoryBot.define do
  factory :user do
    nickname              { 'test' }
    email                 { 'test@example' }
    password              { '000aaa' }
    password_confirmation { password }
    last_name              { '岸' }
    first_name             { '太郎' }
    last_name_kana         { 'キシ' }
    first_name_kana        { 'タロウ' }
    birthday               { '2020-09-29' }
  end
end
