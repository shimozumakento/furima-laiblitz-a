class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :products
  has_many :histories

  validates :nickname, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, length: { minimum: 6 }, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i, message: '半角英数字混合で入力してください' }
  validates :first_name, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥々ー]+\z/, message: '全角文字を使用してください' }
  validates :second_name, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥々ー]+\z/, message: '全角文字を使用してください' }
  validates :first_name_kana, presence: true, format: { with: /\A[\p{katakana}ー－]+\z/, message: '全角カタカナを使用してください' }
  validates :second_name_kana, presence: true, format: { with: /\A[\p{katakana}ー－]+\z/, message: '全角カタカナを使用してください' }
  validates :birthday, presence: true

end
