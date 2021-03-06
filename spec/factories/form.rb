FactoryBot.define do
  factory :form do
    postal_code        { '123-1233' }
    prefecture_id      { 2 }
    city               { '市町村' }
    house_number       { '129' }
    building_number    { '建物929' }
    phone_number       { '12345678901' }
    token              { 'tok_abcdefghijk00000000000000000' }
  end
end
