require 'rails_helper'

RSpec.describe Buyer, type: :model do
  describe '商品購入機能' do
    before do
      order = FactoryBot.build(:order)
      @buyer = FactoryBot.build(:buyer)
  end

      context '商品購入がうまくいくとき' do
        it 'ログイン状態で出品者以外のユーザーのみ商品を購入できる' do
          expect(@).to be_valid
        end

        it '郵便番号、都道府県、市区町村、番地、電話番号を入力したら購入できる' do
          expect(@user).to be_valid
        end
      end

      context '商品購入がうまくいかないとき' do
        it '郵便番号が空だと購入できない' do          
       end 
       it '都道府県が空だと購入できない' do          
       end 
       it '市区町村が空だと購入できない' do          
       end 
       it '番地が空だと購入できない' do          
       end 
       it '電話番号が空だと購入できない' do          
       end 
       it '電話番号は11毛体内の数値でないと購入できない' do          
       end  
     end
   end
 end

