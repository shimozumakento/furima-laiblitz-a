class HistoryAddress

  include ActiveModel::Model
  attr_accessor :postal_code, :shipping_area_id, :city, :street_address, :building_name, :phone_number, :product_id, :user_id

  

  def save
    history = History.create(user_id: user_id, product_id: product_id)
    Address.create(postal_code: postal_code, shipping_area_id: shipping_area_id, city: city, street_address: street_address, building_name: building_name, phone_number: phone_number, history_id: history.id)
  end
end