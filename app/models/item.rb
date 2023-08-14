class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  belongs_to_active_hash :category, foreign_key: 'category_id', class_name: 'Category'
  belongs_to_active_hash :condition, foreign_key: 'condition_id', class_name: 'Condition'
  belongs_to_active_hash :shipping_cost, foreign_key: 'shipping_cost_id', class_name: 'ShippingCost'
  belongs_to_active_hash :prefecture, foreign_key: 'prefecture_id', class_name: 'Prefecture'
  belongs_to_active_hash :shipping_day, foreign_key: 'shipping_day_id', class_name: 'ShippingDay'
  has_one_attached :image
  has_one :purchase

  validates :product, presence: true
  validates :description, presence: true
  validates :category_id,numericality: { other_than: 1 }
  validates :condition_id,numericality: { other_than: 1 }
  validates :shipping_cost_id,numericality: { other_than: 1 }
  validates :prefecture_id,numericality: { other_than: 1 }
  validates :shipping_day_id,numericality: { other_than: 1 }
  validate :default_id_validation
  validate :image_presence

  validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }

  validate :valid_half_width_number
  def valid_half_width_number
    if price.present? && !price.to_s.match?(/\A[0-9]+\z/)
      errors.add(:price, "は半角数字のみ入力してください")
    end
  end

  def default_id_validation
    errors.add(:base, 'デフォルト値のIDは使用できません。') if category_id == Category.default.id
  end

  def image_presence
    errors.add(:image, 'を1枚つける必要があります。') unless image.attached?
  end
  def sold_out?
    purchase.present?
  end
end
