require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品新規登録' do
    context '新規登録できる場合' do
      it '必要事項を全ての項目で過不足なく入力すると登録できる' do
        expect(@item).to be_valid
      end
    end

    context '新規登録できない場合' do
      it 'ユーザー登録している人でないと出品できない' do
        @item.user_id = nil
        @item.valid?
        expect(@item.errors.full_messages)
      end

      it '画像が空では登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages)
      end

      it '商品名が空では登録できない' do
        @item.item_name = ''
        @item.valid?
        expect(@item.errors.full_messages)
      end

      it 'item_infoが空欄だと出品できない' do
        @item.item_info = ''
        @item.valid?
        expect(@item.errors.full_messages)
      end

      it 'item_category_idが「---」だと出品できない' do
        @item.item_category_id = ''
        @item.valid?
        expect(@item.errors.full_messages)
      end

      it 'item_sales_status_idが「---」だと出品できない' do
        @item.item_sales_status_id = ''
        @item.valid?
        expect(@item.errors.full_messages)
      end

      it 'item_shipping_fee_status_idが「---」だと出品できない' do
        @item.item_shipping_fee_status_id = ''
        @item.valid?
        expect(@item.errors.full_messages)
      end

      it 'item_prefecture_idが「---」だと出品できない' do
        @item.item_prefecture_id = ''
        @item.valid?
        expect(@item.errors.full_messages)
      end

      it 'item_scheduled_delivery_idが「---」だと出品できない' do
        @item.item_scheduled_delivery_id = ''
        @item.valid?
        expect(@item.errors.full_messages)
      end

      it '価格が空欄だと出品できない' do
        @item.item_price = ''
        @item.valid?
        expect(@item.errors.full_messages)
      end

      it '価格の範囲が、300円未満だと出品できない' do
        @item.item_price = '100'
        @item.valid?
        expect(@item.errors.full_messages)
      end

      it '価格の範囲が、9,999,999円を超えると出品できない' do
        @item.item_price = '10_000_000'
        @item.valid?
        expect(@item.errors.full_messages)
      end
    end
  end
end
