require 'rails_helper'

RSpec.describe Product, type: :model do
  before do
    @product = FactoryBot.build(:product)
  end

  describe '商品出品' do
    context '商品出品がうまくいくとき' do
      it '商品名、カテゴリー、状態、運賃、発送元地域、発送日数、金額、説明、画像が入っているときは登録できる' do
        expect(@product).to be_valid
      end
    end

    context '商品出品がうまくいかないとき' do
      it '商品名が空では登録できない' do
        @product.name = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Name can't be blank")
      end

      it 'カテゴリーが空では登録できない' do
        @product.category_id = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Category can't be blank")
      end

      it 'カテゴリー選択が1では登録できない' do
        @product.category_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include('Category must be other than 1')
      end

      it '状態が空では登録できない' do
        @product.status_id = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Status can't be blank")
      end

      it '状態選択idが1では登録できない' do
        @product.status_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include('Status must be other than 1')
      end

      it '運賃が空では登録できない' do
        @product.delivery_fee_id = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Delivery fee can't be blank")
      end

      it '運賃選択idが1では登録できない' do
        @product.delivery_fee_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include('Delivery fee must be other than 1')
      end

      it '発送先地域が空では登録できない' do
        @product.perfecture_id = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Perfecture can't be blank")
      end

      it '発送先地域選択が1では登録できない' do
        @product.perfecture_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include('Perfecture must be other than 1')
      end

      it '発送日程が空では登録できない' do
        @product.delivery_days_id = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Delivery days can't be blank")
      end

      it '発送日程選択が1では登録できない' do
        @product.delivery_days_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include('Delivery days must be other than 1')
      end

      it '金額が空では登録できない' do
        @product.price = ''
        @product.valid?
        expect(@product.errors.full_messages).to include('Price is invalid')
      end

      it '金額が300円未満では登録できない' do
        @product.price = 200
        @product.valid?
        expect(@product.errors.full_messages).to include('Price must be greater than 299')
      end

      it '金額が9,999,999より大きいと登録できない' do
        @product.price = 10_000_000
        @product.valid?
        expect(@product.errors.full_messages).to include('Price must be less than 10000000')
      end

      it '金額は半角数字以外では登録できない' do
        @product.price = 'ひゃくまんえん'
        @product.valid?
        expect(@product.errors.full_messages).to include('Price is not a number')
      end

      it '金額は半角英数字混合では登録できない' do
        @product.price = '100dollar'
        @product.valid?
        expect(@product.errors.full_messages).to include('Price is not a number')
      end

      it '金額は半角英語では登録できない' do
        @product.price = 'price'
        @product.valid?
        expect(@product.errors.full_messages).to include('Price is not a number')
      end

      it '説明文が空では登録できない' do
        @product.description = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Description can't be blank")
      end

      it '画像が空では登録できない' do
        @product.image = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("Image can't be blank")
      end
    end
  end
end
