class Product < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  validates :image, presence: true
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

  has_one_attached :image
end
