class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category_id
  belongs_to :condition_id
  belongs_to :shipping_cost_id
  belongs_to :prefecture_id
  belongs_to :shipping_day_id
  has_one_attached :image
  validates :price, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }
end