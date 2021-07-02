require 'rails_helper'
RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe "商品出品機能" do
   context '商品登録ができる時' do
    it '全ての項目が埋まっていれば出品できる' do
       expect(@item).to be_valid
   end
  end
  context '商品出品ができない時' do
    it '画像が空では登録できない' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include "Image can't be blank"
    end
    it '商品名が空では登録できない' do
      @item.item_name = ''
      @item.valid?
      expect(@item.errors.full_messages).to include "Item name can't be blank"
    end
    it '商品の説明が空では登録できない' do
      @item.description = ''
      @item.valid?
      expect(@item.errors.full_messages).to include "Description can't be blank"
    end
    it 'カテゴリーの情報が空では登録できない' do
      @item.category_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include "Category can't be blank"
    end
    it '商品状態についてが空では登録できない' do
      @item.status_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include "Status can't be blank"
    end
    it '配送料負担についてが空では登録できない' do
      @item.delibery_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include "Delibery can't be blank"
    end
    it '発送元の地域が空では登録できない' do
      @item.area_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include "Area can't be blank"
    end
    it '発送までの日数が空では登録できない' do
      @item.guideline_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include "Guideline can't be blank"
    end
    it '販売価格が空では登録できない' do
      @item.price = ''
      @item.valid?
      expect(@item.errors.full_messages).to include "Price can't be blank"
    end
    it '販売価格は￥300〜￥9,999,999の範囲で無いと登録できない' do
      @item.price = '22'
      @item.valid?
      expect(@item.errors.full_messages).to include "Price is too short (minimum is 3 characters)"
    end
    it '販売価格は半角数字のみ出ないと登録できない' do
      @item.price = 'aaa'
      @item.valid?
      expect(@item.errors.full_messages).to include "Price is too short (minimum is 3 characters)"
    end
  end
 end
end