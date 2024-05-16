class Product < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
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
end
