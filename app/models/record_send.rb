class RecordSend
  include ActiveModel::Model
  attr_accessor :item_id, :user_id, :postal_code, :area_id, :municipality, :address, :building, :phone, :token
  
  # send.rbのバリデーション
  with_options presence: true do
   validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/ }
   validates :area_id,     numericality: { other_than: 1 }
   validates :municipality
   validates :address
   validates :phone,       format: { with: /\A\d{10,11}\z/ }
   # record.rbのバリデーション
   validates :item_id
   validates :user_id
   
   validates :token
  end

  def save
    # 購入情報を保存し、変数recordに代入する
    record = Record.create(item_id: item_id, user_id: user_id)
    # 住所を保存する
    # record_idには、変数recordのidと指定する
    Haisou.create(postal_code: postal_code, area_id: area_id, municipality: municipality, address: address, building: building, phone: phone, record_id: record.id)
  end

end

