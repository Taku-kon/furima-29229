require 'rails_helper'

RSpec.describe Address, type: :model do

  before do
    @address = FactoryBot.build(:address)
  end

  context '住所が保存される時' do
    it "postal_code,prefecture_id,city,house_number,phone_numが存在すれば保存できる" do
      @address.building_name = nil
      expect(@address).to be_valid
    end

    it "postal_code,prefecture_id,city,house_number,phone_num + building_nameがある状態でも保存できる"
      expect(@address).to be_valid
    end
  end

  context '住所が保存されない時' do
    it "郵便番号が空欄では保存できない" do
      @address.postal_code = nil
      @address.valid?
      expect(@address.errors.messages).to include("Postal code can't be blank")
    end

    it "都道府県が選択されていなければ保存できない" do
      @address.prefecture_id = "1"
      @address.valid?
      expect(@address.errors.messages).to include("Prefecture can't be blank")
    end

    it "都道府県が空欄では保存できない" do
      @address.prefecture_id = nil
      @address.valid?
      expect(@address.errors.messages).to include("Prefecture can't be blank")
    end

    it "市区町村が入力されていなければ保存できない" do
      @address.city = nil
      @address.valid?
      expect(@address.errors.messages).to include("City can't be blank")
    end

    it "番地が入力されていなければ保存できない" do
      @address.house_number = nil
      @address.valid?
      expect(@address.errors.messages).to include("House number can't be blank")
    end

    it "電話番号が入力されていなければ保存できない" do
      @address.phone_num = nil
      @address.valid?
      expect(@address.errors.messages).to include("Phone num can't be blank")
    end

    it "電話番号にハイフンが入力されていると保存できない" do
      @address.phone_num = "090-1234-5678"
      @address.valid?
      expect(@address.errors.messages).to include("Phone num is invalid. Input half-width characters.")
    end

    it "郵便番号にハイフンが入っていないと保存できない" do
      @address.postal_code = "1230002"
      @address.valid?
      expect(@address.errors.messages).to include("Postal code is invalid. Include hyphen(-)")
    end

    it "item_idが空の状態では保存できない" do
      @order.item_id = nil
      @address.valid?
      expect(@address.errors.full_message).to include("Item_id can't be blank")
    end

    it "user_idが空の状態では保存できない" do
      @address.user_id = nil
      @address.valid?
      expect(@address.errors.full_message).to include("User_id can't be blank")
    end

    it "tokenが空では保存されない" do
      @address.token = nil 
      @address.valid?
      expect(@address.erors.full_message).to include("Token can't be blank")
    end
  end

end