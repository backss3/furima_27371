class OrderAddress
  include ActiveModel::Model
  attr_accessor :postal_cord, :prefecture_id, :city, :house_number, :building_name, :phone_number, :item_id, :user_id
  validates :postal_cord, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include include hyphen(-)' }
  def save
    order = Order.create(
      user_id: user_id, item_id: item_id
    )
    Address.create(user_id: user_id, postal_cord: postal_cord, prefecture_id: prefecture_id, city: city, house_number: house_number, building_name: building_name, phone_number: phone_number, item_id: item_id)
  end
end
