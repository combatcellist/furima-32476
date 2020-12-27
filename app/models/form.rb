class Form
  include ActiveModel::Model
  attr_accessor :token, :postcode, :prefecture_id, :city, :address, :building_name, :phone_number, :user_id, :item_id, :order_id

  with_options presence: true do
    validates :city
    validates :address
    validates :token
    validates :prefecture_id
    validates :phone_number, format: { with: /\A0[0-9]+\z/ }
    validates :postcode, format: { with: /\A\d{3}[-]\d{4}\z/ }
  end

  
  def save
    Order.create(user_id: user_id, item_id: item_id)
    Destination.create(
      postcode: postcode,
      prefecture_id: prefecture_id,
      city: city,
      address: address,
      building_name: building_name,
      phone_number: phone_number,
      order_id: order_id
    )
  end



end