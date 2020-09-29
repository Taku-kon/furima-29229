require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do
    it "nicknameが空だと登録できない" do
      user = FactoryBot.build(:user)
      user.nickname = ""
      user.valid?
      expect(user.errors.full_messages).to include("Nickname can't be blank")
    end
    it "emailが空では登録できない" do
      user = FactoryBot.build(:user)
      user.email = ""
      user.valid?
      expect(user.errors.full_messages).to include("Email can't be blank")
    end
    it "emailが同じものは登録できない" do
      user = FactoryBot.create(:user)
      another_user = build(:user, email: user.email)
      another_user.valid?
      expect(another_user.errors[:email]).to include("Email has already been taken")
    end
    it "emailに＠が含まれていないと登録できない" do
      user = FactoryBot.create(:user)
      user.email = "aaagmail.com"
      user.valid?
      expect(user.errors.full_messages).to include("Emailは正確に入力してください")
    end
    it "passwordが空だと登録できない" do
      user = FactoryBot.build(:user)
      user.password = ""
      user.valid?
      expect(user.errors.full_messages).to include("Password can't be blank")
    end
    it "password_confirmationが空では登録できないこと" do
      user = FactoryBot.build(:user)
      user.password_confirmation = ""
      user.valid?
      expect(user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it "passwordが５文字以下では登録できない" do
      user = FactoryBot.build(:user)
      user.password = "12345"
      user.password_confirmation = "12345"
      user.valid?
      expect(user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end
    it "passwordに半角英字を含んでないと登録できない" do
      user = FactoryBot.build(:user)
      user.password = "123456"
      user.password_confirmation = "123456"
      user.valid?
      expect(user.errors.full_messages).to include("半角英字を含ませてください")
    end
    it "passwordに半角数字を含んでないと登録できない" do
      user = FactoryBot.build(:user)
      user.password = "abcdef"
      user.password_confirmation = "abcdef"
      user.valid?
      expect(user.errors.full_messages).to include("半角数字を含ませてください")
    end
    it "first-nameが空だと登録できない" do
      user = FactoryBot.build(:user)
      user.first_name = ""
      user.valid?
      expect(user.errors.full_messages).to include("First-name can't be blank")
    end
    it "last-nameが空だと登録できない" do
      user = FactoryBot.build(:user)
      user.last_name = ""
      user.valid?
      expect(user.errors.full_messages).to include("Last-name can't be blank")
    end
    it "first-nameが全角でないと登録できない" do
      user = FactoryBot.build(:user)
      user.first_name = "ｱｲｳｴｵ"
      user.valid?
      expect(user.errors[:first_name]).to include("は不正な値です")
    end
    it "last-nameが全角でないと登録できない" do
      user = FactoryBot.build(:user)
      user.last_name = "ｱｲｳｴｵ"
      user.valid?
      expect(user.errors[:last_name]).to include("は不正な値です")
    end
    it "first-kanaが空だと登録できない" do
      user = FactoryBot.build(:user)
      user.first_kana = ""
      user.valid?
      expect(user.errors.full_messages).to include("First-kana can't be blank")
    end
    it "last-kanaが空だと登録できない" do
      user = FactoryBot.build(:user)
      user.last_kana = ""
      user.valid?
      expect(user.errors.full_messages).to include("Last-kana can't be blank")
    end
    it "first-kanaは全角カタカナでないと登録できない" do
      user = FactoryBot.build(:user)
      user.first_kana = "あいうえお"
      user.valid?
      expect(user.errors[:first_kana]).to include("は不正な値です")
    end
    it "last-kanaは全角カタカナでないと登録できない" do
      user = FactoryBot.build(:user)
      user.last_kana = "あいうえお"
      user.valid?
      expect(user.errors[:last_kana]).to include("は不正な値です")
    end
    it "birthdayが空だと登録できない" do
      user = FactoryBot.build(:user)
      user.birthday = ""
      user.valid?
      expect(user.errors.full_messages).to include("Birthday can't be blank")
    end
  end
end