require 'rails_helper'

RSpec.describe Order, type: :model do
  before do
    @order = FactoryBot.build(:order)
  end

  describe '商品購入機能' do
    context '商品購入がうまくいくとき' do
      it 'ログイン状態で出品者以外のユーザーのみ項目を入力することで商品を購入できる' do
      end
      it 'クレジットカード決済ができる' do
      end
    end

    context '商品購入がうまくいかないとき' do
      it 'クレジットカード情報が空では登録できない' do
      end
    end
  end
end
