require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @order_address = FactoryBot.build(:order_address, user_id: user.id, item_id: item.id)
  end
  describe '寄付情報の保存' do
    context '内容に問題ない場合' do
      it '全て入力されていれば保存できる' do
        expect(@order_address).to be_valid
      end
      it 'building_nameが空でも保存できる' do
        @order_address.building = ''
        expect(@order_address).to be_valid
      end
    end
    context '保存できない場合' do
      it 'tokenが空では保存できない' do
        @order_address.token = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Token can't be blank")
      end
      it 'post_codeが空では保存できない' do
        @order_address.post_code = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Post code can't be blank")
      end
      it 'post_codeに「-」がなければ保存できない' do
        @order_address.post_code = '1234567'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Post code はハイフンを含む7桁で入力してください')
      end
      it 'prefecture_idが空では保存できない' do
        @order_address.prefecture_id = 1
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Prefecture を選択してください')
      end
      it 'townが空では保存できない' do
        @order_address.town = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Town can't be blank")
      end
      it 'street_addressが空では保存できない' do
        @order_address.street_address = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Street address can't be blank")
      end
      it 'telephone_numberが空では保存できない' do
        @order_address.telephone_number = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Telephone number can't be blank")
      end
      it 'phone_numberに「-」があると保存できない' do
        @order_address.telephone_number = '090-0000-0000'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Telephone number は10桁または11桁で入力してください')
      end
      it 'phone_numberが9桁以下では保存できない' do
        @order_address.telephone_number = '123456789'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Telephone number は10桁または11桁で入力してください')
      end
      it 'phone_numberに12桁以上では保存できない' do
        @order_address.telephone_number = '123456789012'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Telephone number は10桁または11桁で入力してください')
      end
      it 'userが紐付いていなければ保存できない' do
        @order_address.user_id = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("User can't be blank")
      end
      it 'itemが紐付いていなければ保存できない' do
        @order_address.item_id = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
