class User < ApplicationRecord
  has_many :purchases
  validates :first_name, presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/}
  validates :family_name, presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/}
  validates :k_family_name, presence: true, format: { with: /\A[ァ-ヶー－]+\z/}
  validates :k_first_name, presence: true, format: { with: /\A[ァ-ヶー－]+\z/}
  validates :birth, presence: true
  validates :nickname, presence: true
  validate :password_complexity
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def has_purchased?(item)
    purchases.exists?(item: item)
  end

  private

  def password_complexity
    return if password.blank? || password.match?(/\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i)

    errors.add(:password, 'は英字と数字の両方を含む必要があります')
  end
end