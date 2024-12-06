class OrderAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :post_code, :prefecture_id, :town, :street_address, :building, :telephone_number, :token

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :post_code, format: { with: /\A\d{3}-\d{4}\z/, message: 'はハイフンを含む7桁で入力してください' }
    validates :prefecture_id, numericality: { other_than: 1, message: 'を選択してください' }
    validates :town
    validates :street_address
    validates :telephone_number, format: { with: /\A\d{10,11}\z/, message: 'は10桁または11桁で入力してください' }
    validates :token
  end

  def save
    # 寄付情報を保存し、変数donationに代入する
    order = Order.create(item_id: item_id, user_id: user_id)
    # 住所を保存する
    # donation_idには、変数donationのidと指定する
    Address.create(post_code: post_code, prefecture_id: prefecture_id, town: town, street_address: street_address,
                   building: building, telephone_number: telephone_number, order_id: order.id)
  end
end
