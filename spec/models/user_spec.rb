require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe "ユーザー新規登録" do
   context '新規登録ができる時' do
    it 'nickname,email,encrypted_password,password_confirmation,familyname,firstname,family_kana,first_kana,birthdayが存在すれば登録できる' do
      expect(@user).to be_valid
    end
   end
   context '新規登録ができない時' do
    it "nicknameが空では登録できない" do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Nickname can't be blank"
    end
    it "emailが空では登録できない" do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Email can't be blank"
    end
    it "emailが重複していると登録出来ない" do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken')
    end
    it "emailに@が含まれていないと登録できない" do
      @user.email = 'ddddd'
      @user.valid?
      expect(@user.errors.full_messages).to include "Email is invalid"
    end
    it 'passwordは数字のみでは登録できない' do
       @user.password = '11111'
       @user.valid?
       expect(@user.errors.full_messages).to include("Password is invalid")
    end
    it 'passwordは全角のみだと登録できない' do
       @user.password = 'ああああ'
       @user.valid?
       expect(@user.errors.full_messages).to include("Password is invalid")
    end  
    it 'passwordが空では登録できない' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it 'passwordは半角英数字混合でないと登録できない' do
      @user.password = 'aaaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid")
    end
    it 'passwordが5文字以下では登録できない' do
      @user.password = '00000'
      @user.password_confirmation = '00000'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end
    it 'passwordが存在してもpassword_confirmationが空では登録できない' do
      @user.password_confirmation = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it "familynameが空では登録できない" do
      @user.familyname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Familyname can't be blank"
    end
    it "familynameは漢字、ひらがな、カタカナでないと登録できない" do
      @user.familyname = 'aaa'
        @user.valid?
        expect(@user.errors.full_messages).to include "Familyname is invalid"
    end
    it "firstnameが空では登録できない" do
        @user.firstname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Firstname can't be blank"
    end
    it "firstnameは漢字、ひらがな、カタカナでないと登録できない" do
      @user.firstname = 'aaa'
        @user.valid?
        expect(@user.errors.full_messages).to include "Firstname is invalid"
    end
    it "family_kanaが空では登録できない" do
        @user.family_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Family kana can't be blank"
    end
    it "family_kanaはカタカナでないと登録できない" do
      @user.family_kana = 'あ'
        @user.valid?
        expect(@user.errors.full_messages).to include "Family kana is invalid"
    end
    it "first_kanaが空では登録できない" do
        @user.first_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "First kana can't be blank"
    end
    it "first_kanaがカタカナでないと登録できない" do
        @user.first_kana = 'あ'
        @user.valid?
        expect(@user.errors.full_messages).to include "First kana is invalid"
    end
    it "birthdayが空では登録できない" do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Birthday can't be blank"
    end
   end
  end
end
