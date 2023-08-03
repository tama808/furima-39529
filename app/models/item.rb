class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  belongs_to_active_hash :category, foreign_key: 'category_id', class_name: 'Category'
  belongs_to_active_hash :condition, foreign_key: 'condition_id', class_name: 'Condition'
  belongs_to_active_hash :shipping_cost, foreign_key: 'shipping_cost_id', class_name: 'ShippingCost'
  belongs_to_active_hash :prefecture, foreign_key: 'prefecture_id', class_name: 'Prefecture'
  belongs_to_active_hash :shipping_day, foreign_key: 'shipping_day_id', class_name: 'ShippingDay'
  has_one_attached :image

  validates :product, presence: true
  validates :description, presence: true
  validates :category_id, exclusion: { in: [Category.default.id] }
  validates :condition_id, exclusion: { in: [Condition.default.id]}
  validates :shipping_cost_id, exclusion: { in: [ShippingCost.default.id]}
  validates :prefecture_id, exclusion: { in: [Prefecture.default.id]}
  validates :shipping_day_id, exclusion: { in: [ShippingDay.default.id]}
  validate :default_id_validation
  validate :image_presence

  validates :price, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }
  
  def default_id_validation
    errors.add(:base, 'デフォルト値のIDは使用できません。') if category_id == Category.default.id
  end

  def image_presence
    errors.add(:image, 'を1枚つける必要があります。') unless image.attached?
 end
end