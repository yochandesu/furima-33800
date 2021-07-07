require 'rails_helper'
RSpec.describe RecordSend, type: :model do
  before do
    item = FactoryBot.create(:item)
    user = FactoryBot.build(:user)
    user.email = 'roke@roke'
    user.save
    @record_send = FactoryBot.build(:record_send, item_id:item.id, user_id:user.id)
    sleep 0.1
  end

  describe 'クレジットカード決済' do
    context 'クレジットカード決済ができる時' do
      it '建物名以外の全ての項目が正しく入力されていれば購入できる' do
        expect(@record_send).to be_valid
      end
    end

    context '購入ができない時' do
      it 'トークンが空では登録できない' do
        @record_send.token = ''
        @record_send.valid?
        expect(@record_send.errors.full_messages).to include("Token can't be blank")
      end
      it '郵便番号が空では登録できない' do
        @record_send.postal_code = ''
        @record_send.valid?
        expect(@record_send.errors.full_messages).to include("Postal code can't be blank")
      end
      it '都道府県が空では登録できない' do
        @record_send.area_id = ''
        @record_send.valid?
        expect(@record_send.errors.full_messages).to include("Area can't be blank")
      end
      it '都道府県が1では登録できない' do
        @record_send.area_id = '1'
        @record_send.valid?
        expect(@record_send.errors.full_messages).to include("Area must be other than 1")
      end
      it '市区町村が空では登録できない' do
        @record_send.municipality = ''
        @record_send.valid?
        expect(@record_send.errors.full_messages).to include("Municipality can't be blank")
      end
      it '番地が空では登録できない' do
        @record_send.address = ''
        @record_send.valid?
        expect(@record_send.errors.full_messages).to include("Address can't be blank")
      end
      it '電話番号が空では登録できない' do
        @record_send.phone = ''
        @record_send.valid?
        expect(@record_send.errors.full_messages).to include("Phone can't be blank")
      end
    end
  end
end
