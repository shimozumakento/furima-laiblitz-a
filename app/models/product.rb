class Product < ApplicationRecord

  extend ActiveHash::Associations::ActiveRecordExtensions
  validates :images, presence: true
  validates :images, length: { minimum: 1, maximum: 5, message: "は1枚以上5枚以下にしてください" }
  validates :product_name, presence: true
  validates :description, presence: true
  belongs_to :category
  validates :category_id, numericality: { other_than: 1 , message: "can't be blank"}

  belongs_to :condition
  validates :condition_id, numericality: { other_than: 1 , message: "can't be blank"}

  belongs_to :shipping_cost
  validates :shipping_cost_id, numericality: { other_than: 1 , message: "can't be blank"}

  belongs_to :shipping_area
  validates :shipping_area_id, numericality: { other_than: 1 , message: "can't be blank"}

  belongs_to :shipping_day
  validates :shipping_day_id, numericality: { other_than: 1 , message: "can't be blank"}

  validates :price, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999  }

  has_many_attached :images
  belongs_to :user
  has_one :history

end
