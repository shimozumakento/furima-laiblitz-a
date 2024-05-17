class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :products
  has_many :histories

  validates :nickname, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, length: { minimum: 6 }, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i, message: 'is invalid. Include both letters and numbers' }
  validates :first_name, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥々ー]+\z/, message: ' is invalid. Input full-width characters' }
  validates :second_name, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥々ー]+\z/, message: 'is invalid. Input full-width characters' }
  validates :first_name_kana, presence: true, format: { with: /\A[\p{katakana}ー－]+\z/, message: 'is invalid. Input full-width katakana characters' }
  validates :second_name_kana, presence: true, format: { with: /\A[\p{katakana}ー－]+\z/, message: 'is invalid. Input full-width katakana characters' }
  validates :birthday, presence: true

end
