FactoryBot.define do
  factory :item do
    item_name                { '商品' }
    item_description         { '商品説明' }
    category_id              { '2' }
    product_condition_id     { '2' }
    shipping_cost_id         { '2' }
    prefecture_id            { '2' }
    delivery_date_id         { '2' }
    price                    { '3000' }
    association :user

    after(:build) do |message|
      message.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
