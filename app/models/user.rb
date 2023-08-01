class User < ApplicationRecord
  validates :first_name, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥ー]+\z/}
  validates :family_name, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥ー]+\z/}
  validates :k_family_name, presence: true, format: { with: /\A[ァ-ヶー－]+\z/}
  validates :k_first_name, presence: true, format: { with: /\A[ァ-ヶー－]+\z/}
  validates :birth, presence: true
  validates :nickname, presence: true
  validate :password_complexity

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable  #条件に合っていればDBに保存する

  private

  def password_complexity
    return if password.blank? || password.match?(/\A(?=.*[a-zA-Z])(?=.*\d)/)

    errors.add(:password, 'は英字と数字の両方を含む必要があります')
  end
end
