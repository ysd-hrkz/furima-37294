class OrderShipping
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :post_code, :shipping_area_id, :city, :address, :building_name, :phone_num, :token

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :shipping_area_id, numericality: { other_than: 1 , message: "can't be blank"}
    validates :city
    validates :address
    validates :building_name
    validates :phone_num, format: {with: /\A[0-9]{10,11}\z/, message: "is invalid"}
    validates :token
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Shipping.create
    (post_code: post_code, shipping_area_id: shipping_area_id,
     city: city, address: address, building_name: building_name, phone_num: phone_num, purchase_id: purchase.id)
  end
end