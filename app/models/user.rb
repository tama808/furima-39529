class User < ApplicationRecord
  validates :first_name, presence: true
  validates :family_name, presence: true
  validates :k_family_name, presence: true
  validates :k_first_name, presence: true

  validates :password, presence: true, length: { minimum: 6 }
  validate :password_complexity

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  private

  def password_complexity
    return if password.blank? || password.match?(/\A(?=.*[a-zA-Z])(?=.*\d)/)

    errors.add(:password, 'は英字と数字の両方を含む必要があります')
  end
end
