class Form

  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :house_number, :building_number, :phone_number, :user_id, :item_id
  attr_accessor :token

  with_options presence: true do
    validates :city
    validates :house_number
    validates :phone_number
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "Input correctly"}
    validates :token
    validates :user_id
    validates :item_id
    
  end

  

  validates :phone_number, numericality: { only_integer: true }
 
  VALID_PHONE_REGEX = /\A\d{10}$|^\d{11}\z/
  validates :phone_number, format: { with: VALID_PHONE_REGEX, message: "Input correctly"}


  with_options numericality: { other_than: 1, message: "can't be blank" } do
    validates :prefecture_id
  end


  def save
    buy = Buy.create(user_id: user_id, item_id: item_id)
    # 住所を保存する
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, house_number: house_number, 
     building_number: building_number, phone_number: phone_number, buy_id: buy.id)
  end
end
