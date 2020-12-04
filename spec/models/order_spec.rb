require 'rails_helper'

RSpec.describe Order, type: :model do

  before do
    @order = FactoryBot.build(:order)
  end

  context '購入がうまくいく時' do
    it "item_id,user_idが存在すれば購入できる" do
      expect(@order).to be_valid
    end

  context '購入がうまくいかない時' do
    it "item_idが空の状態では保存できない" do
      @order.item_id = nil
      @item.valid?
      expect(@order.errors.full_message).to include("Item_id can't be blank")
    end

    it "user_idが空の状態では保存できない" do
      @order.user_id = nil
      @item.valid?
      expect(@order.errors.full_message).to include("User_id can't be blank")
    end
  end

end
