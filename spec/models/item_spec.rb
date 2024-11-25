require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品の入力' do
    context '新規登録できるとき' do
      it '商品の値が全て存在すれば登録できる' do
        expect(@item).to be_valid
      end
    end
    context '出品できないとき' do
      it 'nameが空では登録できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it 'explanationが空では登録できない' do
        @item.explanation = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Explanation can't be blank")
      end
      it 'category_idが空では登録できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it 'situation_idがハイフンでは登録できない' do
        @item.situation_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Situation must be other than 1')
      end
      it 'delivery_idがハイフンの時は出品出来ない' do
        @item.delivery_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Delivery must be other than 1')
      end
      it 'prefecture_idがハイフンの時は出品出来ない' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Prefecture must be other than 1')
      end
      it 'day_idがハイフンの時は出品出来ない' do
        @item.day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Day must be other than 1')
      end
      it 'sales_priceが未入力の時は出品出来ない' do
        @item.sales_price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Sales price can't be blank", 'Sales price is not a number')
      end
      it 'user_idが全角では登録できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end
      it 'imageは空では登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it '299円以下の価格入力すると出品出来ない' do
        @item.sales_price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include('Sales price must be greater than or equal to 300')
      end
      it '10_000_000円以上の価格入力すると出品出来ない' do
        @item.sales_price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('Sales price must be less than or equal to 9999999')
      end
      it '全角入力すると出品出来ない' do
        @item.sales_price = '８８８'
        @item.valid?
        expect(@item.errors.full_messages).to include('Sales price is not a number')
      end
    end
  end
end
