class User < ApplicationRecord
  validates :first_name, presence: true
  validates :family_name, presence: true
  validates :k_family_name, presence: true
  validates :k_first_name, presence: true
  validates :encrypted_password, presence: true, length: { minimum: 6 }, format: { with: /\A[a-zA-Z0-9]+\z/ }
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable   

end
