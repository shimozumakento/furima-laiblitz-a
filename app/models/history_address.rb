class HistoryAddress

  include ActiveModel::Model
  attr_accessor :user_id, :product_id, :postal_code, :shipping_area_id, :city, :street_address, :building_name, :phone_number,:token

  
  with_options presence: true do
    validates :user_id
    validates :product_id
    validates :postal_code, format: { with: /\A\d{3}-\d{4}\z/, message: "is invalid. Include hyphen(-)" }
    validates :shipping_area_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :city
    validates :street_address
    validates :phone_number, length: { minimum: 10, maximum: 11 }, format: { with: /\A\d+\z/, message: "Input only numbers" }
    validates :token
  end
  



  def save
    history = History.create(user_id: user_id, product_id: product_id)
    Address.create(postal_code: postal_code, shipping_area_id: shipping_area_id, city: city, street_address: street_address, building_name: building_name, phone_number: phone_number, history_id: history.id)
  end
end

