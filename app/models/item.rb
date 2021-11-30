class Item < ApplicationRecord
  belongs_to :user
  has_one :buy
  has_one_attached :image

extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category_id
  belongs_to :delivery_date_id
  belongs_to :product_condition_id
  belongs_to :prefecture_id
  belongs_to :shipping_cost_id

  #空の投稿を保存できないようにする
  validates :title, :text, presence: true

  #ジャンルの選択が「--」の時は保存できないようにする
  validates :category_id, numericality: { other_than: 1 }
  validates :product_condition_id, numericality: { other_than: 1 }
  validates :shipping_cost_id, numericality: { other_than: 1 }
  validates :prefecture_id, numericality: { other_than: 1 }
  validates :delivery_id, numericality: { other_than: 1 }
  validates :categoty_id, presence: true
  validates :product_condition_id, presence: true
  validates :shipping_cost_id, presence: true
  validates :prefecture_id, presence: true
  validates :image, presence: true
  validates :item_name, presence: true
  validates :item_description, presence: true
  validates :price, presence: true
  validates :delivery_date_id, presence: true
end