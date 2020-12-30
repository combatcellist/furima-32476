class Form
  include ActiveModel::Model
  attr_accessor :token, :postcode, :prefecture_id, :city, :address, :building_name, :phone_number, :user_id, :item_id

  with_options presence: true do
    validates :city
    validates :address
    validates :token
    validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :phone_number, format: { with: /\A\d{11}\z/  }
    validates :postcode, format: { with: /\A\d{3}[-]\d{4}\z/ }
  end

  
  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Destination.create(
      postcode: postcode,
      prefecture_id: prefecture_id,
      city: city,
      address: address,
      building_name: building_name,
      phone_number: phone_number,
      order_id: order.id
    )
  end



end