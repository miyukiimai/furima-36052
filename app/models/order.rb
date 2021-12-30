class Order < ApplicationRecord
  validates :price, presense: true
end
