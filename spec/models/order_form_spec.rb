require 'rails_helper'

RSpec.describe OrderForm, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @order_form = FactoryBot.build(:order_form, user_id: user.id, item_id: item.id)
  end

  describe '配送先が保存できる場合' do

    context '配送先情報の保存ができるとき' do
      it '必要事項を全ての項目で過不足なく入力すると登録できる' do
        expect(@order_form).to be_valid
      end

      it "建物名が空でも保存できる" do
        @order_form.building = ''
        expect(@order_form).to be_valid
      end
    end

    context '配送先が保存できない場合' do

      it "郵便番号が「3桁ハイフン4桁」の半角文字列でなければ保存できない" do
        @order_form.postal_code = ''
        @order_form.valid?
        expect(@order_form.errors.full_messages)
      end

      it "都道府県が空では保存できない" do
        @order_form.item_prefecture_id = ''
        @order_form.valid?
        expect(@order_form.errors.full_messages)
      end

      it "市区町村が空では保存できない" do
        @order_form.city = ''
        @order_form.valid?
        expect(@order_form.errors.full_messages)
      end

      it "番地が空では保存できない" do
        @order_form.addresses = ''
        @order_form.valid?
        expect(@order_form.errors.full_messages)
      end

      it "電話番号が空では保存できない" do
        @order_form.phone_number = ''
        @order_form.valid?
        expect(@order_form.errors.full_messages)
      end

      it "電話番号は、10桁以上11桁以内の半角数値でなければ保存できない" do
        @order_form.phone_number = '123-４５６７-8901'
        @order_form.valid?
        expect(@order_form.errors.full_messages)
      end
    end
  end
end