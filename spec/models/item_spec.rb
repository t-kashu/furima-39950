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
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("User must exist")
      end

      it '画像が空では登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it '商品名が空では登録できない' do
        @item.item_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item name can't be blank")
      end

      it 'item_infoが空欄だと出品できない' do
        @item.item_info = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item info can't be blank")
      end

      it 'item_category_idが「---」だと出品できない' do
        @item.item_category_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Item category Category can't be blank")
      end

      it 'item_sales_status_idが「---」だと出品できない' do
        @item.item_sales_status_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Item sales status Sales status can't be blank")
      end

      it 'item_shipping_fee_status_idが「---」だと出品できない' do
        @item.item_shipping_fee_status_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Item shipping fee status Shipping fee status can't be blank")
      end

      it 'item_prefecture_idが「---」だと出品できない' do
        @item.item_prefecture_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Item prefecture Prefecture can't be blank")
      end

      it 'item_scheduled_delivery_idが「---」だと出品できない' do
        @item.item_scheduled_delivery_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Item scheduled delivery Scheduled delivery can't be blank")
      end

      it '価格が空欄だと出品できない' do
        @item.item_price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item price can't be blank", "Item price is not a number")
      end

      it '価格の範囲が、300円未満だと出品できない' do
        @item.item_price = '100'
        @item.valid?
        expect(@item.errors.full_messages).to include("Item price must be greater than or equal to 300")
      end

      it '価格の範囲が、9,999,999円を超えると出品できない' do
        @item.item_price = '10_000_000'
        @item.valid?
        expect(@item.errors.full_messages).to include("Item price must be an integer")
      end
    end
  end
end
