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
  validates :genre_id, numericality: { other_than: 1 }
end