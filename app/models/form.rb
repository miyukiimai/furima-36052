class Form
  #belongs_to :buy

  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :house_number, :building_number, :phone_number, :buy_id, :user_id, :item_id
  attr_accessor :token

  with_options presence: true do
    validates :postal_code
    validates :prefecture_id
    validates :city
    validates :house_number
    validates :phone_number
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "invalid. Include hyphen(-)"}
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "Half-width number"}
    validates :token
  end

  validates :prefecture_id, numericality: {other_than: 0, message: "can't be blank"}
  #validates :postal_code, { message: 'Half-width number' }
  validates :phone_number, numericality: { only_integer: true, message: 'Half-width number'}
  validates :phone_number, numericality: { only_integer: true, message: 'Input only number'}
 
  VALID_PHONE_REGEX = /\A\d{10}$|^\d{11}\z/
  validates :phone_number, format: { with: VALID_PHONE_REGEX, message: "too short minimum is 10 numbers"}
  validates :phone_number, format: { with: VALID_PHONE_REGEX, message: "too long maximum is 11 numbers"}

  def save
    buy = Buy.create(user_id: user_id, item_id: item_id)
    # 住所を保存する
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, house_number: house_number, 
     building_number: building_number, phone_number: phone_number, buy_id: buy.id)
  end
end
