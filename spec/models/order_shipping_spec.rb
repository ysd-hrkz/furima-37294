require 'rails_helper'

RSpec.describe OrderShipping, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item)
    @order_shipping = FactoryBot.build(:order_shipping, user_id: @user.id, item_id: @item.id)
    sleep(0.1)
  end

  describe '配送先情報の保存' do
    context '配送先情報の保存ができる時' do
      it 'すべての項目が正しく入力されているとき' do
        expect(@order_shipping).to be_valid
      end
      it 'user_idが空でなければ登録できる' do
        @order_shipping.user_id = 1
        expect(@order_shipping).to be_valid
      end
      it 'item_idが空でなければ登録できる' do
        @order_shipping.item_id = 1
        expect(@order_shipping).to be_valid
      end
      it '郵便番号が空でなければ登録できる' do
        @order_shipping.post_code = '123-4567'
        expect(@order_shipping).to be_valid
      end
      it '都道府県が空でなければ登録できる' do
        @order_shipping.shipping_area_id = 2
        expect(@order_shipping).to be_valid
      end
      it '市区町村が空でなければ登録できる' do
        @order_shipping.city = '渋谷区'
        expect(@order_shipping).to be_valid
      end
      it '番地が空でなければ登録できる' do
        @order_shipping.address = '渋谷123'
        expect(@order_shipping).to be_valid
      end
      it '建物名が空でも登録できる' do
        @order_shipping.building_name = ''
        expect(@order_shipping).to be_valid
      end
      it '電話番号が空でなければ登録できる' do
        @order_shipping.phone_num = '0312345678'
        expect(@order_shipping).to be_valid
      end
      it 'クレジットカード情報が空でなければ登録できる' do
        @order_shipping.token = 'tok_abcdefghijk00000000000000000'
        expect(@order_shipping).to be_valid
      end
    end

    context '配送先情報の保存ができない時' do
      it 'user_idが空だと保存できない' do
        @order_shipping.user_id = ''
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("User can't be blank")
      end
      it 'item_idが空だと保存できない' do
        @order_shipping.item_id = ''
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("Item can't be blank")
      end
      it '郵便番号が空だと保存できない' do
        @order_shipping.post_code = ''
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("Post code can't be blank")
      end
      it '郵便番号が3桁ハイフン4桁かつ半角数値でない時保存できない' do
        @order_shipping.post_code = '１２ー３４５'
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include('Post code is invalid. Include hyphen(-)')
      end
      it '都道府県が空だと保存できない' do
        @order_shipping.shipping_area_id = ''
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include('Shipping area Select')
      end
      it '都道府県が空だと保存できない' do
        @order_shipping.shipping_area_id = ''
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include('Shipping area Select')
      end
      it '都道府県が「---」だと保存できない' do
        @order_shipping.shipping_area_id = 1
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include('Shipping area Select')
      end
      it '市区町村が空だと保存できない' do
        @order_shipping.city = ''
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("City can't be blank")
      end
      it '番地が空だと保存できない' do
        @order_shipping.address = ''
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("Address can't be blank")
      end
      it '都道府県が空だと保存できない' do
        @order_shipping.shipping_area_id = ''
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include('Shipping area Select')
      end
      it '電話番号が空だと保存できない' do
        @order_shipping.phone_num = ''
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("Phone num can't be blank")
      end
      it '電話番号が半角数値でないとき保存できない' do
        @order_shipping.phone_num = '１１１１１１１１１'
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include('Phone num Input only number')
      end
      it '電話番号が9桁以下のとき保存できない' do
        @order_shipping.phone_num = '111111111'
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include('Phone num Input only number')
      end
      it '電話番号が12桁以上のとき保存できない' do
        @order_shipping.phone_num = '111111111111'
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include('Phone num Input only number')
      end
      it 'クレジットカード情報が空だと保存できない' do
        @order_shipping.token = ''
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
