class OrderAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :house_number, :building_name, :phone_num, :order_id, :item_id, :user_id, :authenticity_token, :order_address, :commit, :order_address, :token

  with_options presence: true do
    validates :phone_num, format: {with: /\A\d{10}\z|\A\d{11}\z/ }
    validates :prefecture_id, :city, :house_number, :token
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :phone_num, format: {with: /\A[0-9]+\z/, message: "is invalid. Input half-width characters."}
  end
  validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }

  def save
    # 注文の情報を保存
    order = Order.create(item_id: item_id, user_id: user_id)
    # 住所の情報を保存
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, house_number: house_number, building_name: building_name, phone_num: phone_num, order_id: order.id)
  end
end