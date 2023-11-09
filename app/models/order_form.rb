class OrderForm
  include ActiveModel::Model
 
  attr_accessor :user_id, :item_id, :postal_code, :item_prefecture_id, :city, :addresses, :building, :phone_number, :token
  validates :user_id,                  presence: true
  validates :item_id,                  presence: true
  validates :postal_code,              presence: true, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Enter it as follows (e.g. 123-4567)' }
  validates :item_prefecture_id,       presence: true, numericality: { other_than: 1, message: "Prefecture can't be blank" }
  validates :city,                     presence: true
  validates :addresses,                presence: true
  validates :phone_number,             presence: true, format: { with: /\A[0-9]{11}\z/, message: 'is invalid' }
  validates :token,                    presence: true
 
  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    shipping_address = ShippingAddress.create(postal_code: postal_code, item_prefecture_id: item_prefecture_id, city: city, addresses: addresses, building: building, phone_number: phone_number, order_id: order.id)
  end
 end