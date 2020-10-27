require 'rails_helper'

RSpec.describe Item, type: :model do
  
  before do
    @item = FactoryBot.build(:item)
  end
  describe '商品出品' do
    context '商品出品がうまくいくとき' do
      it "name,text,price,user_id,shipping_id,ship_pla_id,ship_day_id,condition_id,category_idが存在すれば出品できる" do
        expect(@item).to be_valid
      end
      it "販売価格が半角数字であれば保存できる" do
        @item.price = "1000"
        expect(@item).to be_valid
      end
    end

    context '商品出品がうまくいかないとき' do
      it "画像が空の状態では保存できない" do
        @item.image = ""
        @item.valid?
        expect(@user.errors.full_messages).to include("Image can't be blank")
      end
      it "商品名が入力されていない状態では保存できない" do
        @item.name = ""
        @item.valid?
        expect(@user.errors.full_messages).to include("Name can't be blank")
      end
      it "商品の説明が空白では保存できない" do
        @item.text = ""
        @item.valid?
        expect(@user.errors.full_messages).to include("Text can't be blank")
      end
      it "商品の説明が1000文字以上では保存できない" do
        @item.text = ("あ" * 1001)
        @item.valid?
        expect(@user.errors.full_messages).to include("Text can't be 1000over")
      end
      it "カテゴリが未選択では保存ができない" do
        @item.category_id = "1"
        @item.valid?
        expect(@user.errors.full_messages).to include("Category can't be blank")
      end
      it "商品の状態が未選択では保存ができない" do
        @item.condition_id = "1"
        @item.valid?
        expect(@user.errors.full_messages).to include("Condition can't be blank")
      end
      it "配送料の負担が未選択では保存ができない" do
        @item.shipping_id = "1"
        @item.valid?
        expect(@user.errors.full_messages).to include("Shipping can't be blank")
      end
      it "発送元の地域が未選択では保存ができない" do
        @item.ship_pla_id = "1"
        @item.valid?
        expect(@user.errors.full_messages).to include("Sipping place can't be blank")
      end
      it "発送までの日数が未選択では保存ができない" do
        @item.ship_day_id = "1"
        @item.valid?
        expect(@user.errors.full_messages).to include("Shipping day can't be blank")
      end
      it "金額が入力されていなければ保存ができない" do
        @item.price = ""
        @item.valid?
        expect(@user.errors.full_messages).to include("Price can't be blank")
      end
      it "販売価格が299以下では保存ができない" do
        @item.price = "299"
        @item.valid?
        expect(@user.errors.full_messages).to include("Price can't be 299 or less")
      end
      it "販売価格が9999999以上では保存ができない" do
        @item.price = "10000000"
        @item.valid?
        expect(@user.errors.full_messages).to include("Price can't be 10000000 or higher")
      end
      it "販売価格が全角数字では保存できない" do
        @item.price = "１０００"
        @item.valid?
        expect(@user.errors.full_messages).to include("価格は半角数字で入力してください")
      end
end
