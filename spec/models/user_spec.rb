require 'rails_helper'

RSpec.describe User, type: :model do

  before do
    @user = FactoryBot.build(:user)
  end
  describe '#create' do
    context 'ユーザー登録ができる時'do
      it "nickname,email,password,first-name,first-kana,last-name,last-kana,birthdayが存在すれば登録できる" do
        expect(@user).to be_valid
      end
      it "passwordが６文字以上であれば登録できる" do
        @user.password = "123456"
        @user.password_confirmation = "123456"
        expect(@user).to be_valid
      end
      it "passwordに半角英数字が含まれていれば登録できる" do
        @user.password = "123abc"
        @user.password_confirmation = "123abc"
        expect(@user).to be_valid
      end
      it "last-kanaが全角カタカナであれば登録できる" do
        @user.last_kana = "アイウエオ"
        expect(@user).to be_valid
      end
      it "first-kanaが全角カタカナであれば登録できる" do
        @user.first_kana = "アイウエオ"
        expect(@user).to be_valid
      end
      it "last-nameが全角であれば登録できる" do
        @user.last_name = "アイウエオ"
        expect(@user).to be_valid
      end
      it "first-nameが全角であれば登録できる" do
        @user.first_name = "アイウエオ"
        expect(@user).to be_valid
      end
    end

    context 'ユーザー登録できないとき' do
      it "nicknameが空だと登録できない" do
        @user.nickname = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it "emailが空では登録できない" do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it "emailが同じものは登録できない" do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors[:email]).to include("Email has already been taken")
      end
      it "emailに＠が含まれていないと登録できない" do
        @user.email = "aaagmail.com"
        @user.valid?
        expect(@user.errors.full_messages).to include("Emailは正確に入力してください")
      end
      it "passwordが空だと登録できない" do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it "password_confirmationが空では登録できないこと" do
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it "passwordが５文字以下では登録できない" do
        @user.password = "12345"
        @user.password_confirmation = "12345"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it "passwordに半角英字を含んでないと登録できない" do
        @user.password = "123456"
        @user.password_confirmation = "123456"
        @user.valid?
        expect(@user.errors.full_messages).to include("半角英字を含ませてください")
      end
      it "passwordに半角数字を含んでないと登録できない" do
        @user.password = "abcdef"
        @user.password_confirmation = "abcdef"
        @user.valid?
        expect(@user.errors.full_messages).to include("半角数字を含ませてください")
      end
      it "first-nameが空だと登録できない" do
        @user.first_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First-name can't be blank")
      end
      it "last-nameが空だと登録できない" do
       @user.last_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Last-name can't be blank")
      end
      it "first-nameが全角でないと登録できない" do
        @user.first_name = "ｱｲｳｴｵ"
        @user.valid?
        expect(@user.errors[:first_name]).to include("は不正な値です")
      end
      it "last-nameが全角でないと登録できない" do
        @user.last_name = "ｱｲｳｴｵ"
        @user.valid?
        expect(@user.errors[:last_name]).to include("は不正な値です")
      end
      it "first-kanaが空だと登録できない" do
        @user.first_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First-kana can't be blank")
      end
      it "last-kanaが空だと登録できない" do
        @user.last_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Last-kana can't be blank")
      end
      it "first-kanaは全角カタカナでないと登録できない" do
        @user.first_kana = "あいうえお"
        @user.valid?
        expect(@user.errors[:first_kana]).to include("は不正な値です")
      end
      it "last-kanaは全角カタカナでないと登録できない" do
        @user.last_kana = "あいうえお"
        @user.valid?
        expect(@user.errors[:last_kana]).to include("は不正な値です")
      end
      it "birthdayが空だと登録できない" do
        @user.birthday = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end