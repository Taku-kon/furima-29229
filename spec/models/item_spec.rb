require 'rails_helper'

RSpec.describe Item, type: :model do
  
  describe '#create' do
    before do
      @item = FactoryBot.build(:item)
      @item.image = fixture_file_upload('public/images/test_image.jpg')
    end

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
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it "商品名が入力されていない状態では保存できない" do
        @item.name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it "商品の説明が空白では保存できない" do
        @item.text = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Text can't be blank")
      end
      it "商品の説明が1000文字以上では保存できない" do
        @item.text = ( 'あ' * 1001 )
        @item.valid?
        expect(@item.errors.full_messages).to include("Text is too long (maximum is 1000 characters)")
      end
      it "カテゴリが未選択では保存ができない" do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 1")
      end
      it "商品の状態が未選択では保存ができない" do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition must be other than 1")
      end
      it "配送料の負担が未選択では保存ができない" do
        @item.shipping_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping must be other than 1")
      end
      it "発送元の地域が未選択では保存ができない" do
        @item.ship_pla_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Ship pla must be other than 1")
      end
      it "発送までの日数が未選択では保存ができない" do
        @item.ship_day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Ship day must be other than 1")
      end
      it "金額が入力されていなければ保存ができない" do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it "販売価格が299以下では保存ができない" do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than 299")
      end
      it "販売価格が9999999以上では保存ができない" do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than 10000000")
      end
      it "販売価格が全角数字では保存できない" do
        @item.price = '１０００'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
    end
  end
end
