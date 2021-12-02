class Item < ApplicationRecord
  belongs_to :user
  has_one :buy
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :delivery_date
  belongs_to :product_condition
  belongs_to :prefecture
  belongs_to :shipping_cost

  with_options presence: true do
    validates :image
    validates :item_name
    validates :item_description
    validates :price
    # validates :price, inclusion: { in: 300..9_999_999 }
    # validates :price, format: { with: /\A[0-9]+\z/ }
  end

  #  validates_inclusion_of :price, in: 300..9_999_999
  validates :price, numericality: { greater_than_or_equal_to: 300,
                                    less_than_or_equal_to: 9_999_999 }
  validates :price, numericality: { only_integer: true, message: 'Half-width number' }

  with_options numericality: { other_than: 1, message: "can't be blank" } do
    validates :category_id
    validates :product_condition_id
    validates :shipping_cost_id
    validates :prefecture_id
    validates :delivery_date_id
  end
end
