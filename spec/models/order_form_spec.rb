require 'rails_helper'

RSpec.describe OrderForm, type: :model do
  describe '商品購入機能' do
    before do
      user = FactoryBot.create(:user)
      product = FactoryBot.create(:product)
      @order_form = FactoryBot.build(:order_form, user_id: user.id, product_id: product.id)
      sleep 0.1
    end

    context '商品購入がうまくいくとき' do
      it '郵便番号、都道府県、市区町村、番地、電話番号を入力したら購入できる' do
        expect(@order_form).to be_valid
      end
    end
    context '商品購入がうまくいかないとき' do
      it '郵便番号が空だと購入できない' do
        @order_form.postal_code = ''
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Postal code can't be blank")
      end
      it '都道府県が空だと購入できない' do
        @order_form.perfecture_id = ''
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include('Perfecture is not a number')
      end
      it '市区町村が空だと購入できない' do
        @order_form.city = ''
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("City can't be blank")
      end
      it '番地が空だと購入できない' do
        @order_form.numbering = ''
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Numbering can't be blank")
      end
      it '電話番号が空だと購入できない' do
        @order_form.telephone_number = ''
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Telephone number can't be blank")
      end
      it '電話番号は11桁内の数値でないと購入できない' do
        @order_form.telephone_number = '123456789012'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include('Telephone number is too long (maximum is 11 characters)')
      end
      it '郵便番号は-を含めなければならない' do
        @order_form.postal_code = '123456789012'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include('Postal code is invalid')
      end

      it 'クレジットカード情報が体と購入できない' do
        @order_form.token = ''
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
