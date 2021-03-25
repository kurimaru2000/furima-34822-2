require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe '新規登録/ユーザー情報' do # ユーザー新規登録についてのテストコードを記述します
    context '新規登録がうまくいく時' do
      it 'first_name, last_name, first_name_kana, last_name_kana, birth_dayが存在すれば登録できる' do
        expect(@user).to be_valid
      end
      it 'passwordが６文字以上であれば登録できる' do
        @user.password = 'AAaaa1'
        @user.password_confirmation = 'AAaaa1'
        expect(@user).to be_valid
      end
      it 'passwordが半角英数字混合であれば登録できる' do
        @user.password = 'AAaaa1'
        @user.password_confirmation = 'AAaaa1'
        expect(@user).to be_valid
      end
    end

    context '新規登録がうまくいかない時' do
      it 'nicknameがからでは登録できない' do
        @user = FactoryBot.build(:user)
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'emailが空では登録できない' do
        @user = FactoryBot.build(:user)
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'emailが一意性出なければ登録できない' do
        @user = FactoryBot.build(:user)
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'emailに＠がないと登録できない' do
        @user = FactoryBot.build(:user)
        @user.email = 'taroukungmail.com'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      it 'パスワードがなければ登録できない' do
        @user = FactoryBot.build(:user)
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'パスワードは６文字以上でなければ登録できない' do
        @user = FactoryBot.build(:user)
        @user.password = 'abcd１'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'パスワードは半角英数字混合でなければ登録できない' do
        @user = FactoryBot.build(:user)
        @user.password = 'abcdef'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end
      it 'パスワードは確認用を含めて２回入力しなければ登録できない' do
        @user = FactoryBot.build(:user)
        @user.password = 'abcde1'
        @password_confirmation = ''
        @user.valid?
        # binding.pry
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'パスワードとパスワード（確認用）は値が一致しなければ登録できない' do
        @user = FactoryBot.build(:user)
        @user.password = 'abcde1'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'パスワードが数字のみでは登録できない' do
        @user = FactoryBot.build(:user)
        @user.password = '111111'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end
      it 'パスワードが全角では登録できない' do
        @user = FactoryBot.build(:user)
        @user.password = 'パスワード1'
        @user.password_confirmation = 'パスワード１'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end
    end

    describe '新規登録本人確認情報' do # ユーザー新規登録についてのテストコードを記述します
      context '新規登録がうまくいく時' do
        it 'first_name, last_name, first_name_kana, last_name_kana, birth_dayが存在すれば登録できる' do
          expect(@user).to be_valid
        end
      end
      context '新規登録がうまくいかない時' do
        it '苗字がないと登録できない' do
          @user = FactoryBot.build(:user)
          @user.last_name = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Last name can't be blank")
        end
        it '名前がないと登録できない' do
          @user = FactoryBot.build(:user)
          @user.first_name = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("First name can't be blank")
        end
        it '苗字は全角（漢字・カタカナ・ひらがなでないと登録できない' do
          @user = FactoryBot.build(:user)
          @user.last_name = 'ﾌﾘﾏ'
          @user.valid?
          expect(@user.errors.full_messages).to include('Last name is invalid')
        end
        it '名前は全角（漢字・カタカナ・ひらがなでないと登録できない' do
          @user = FactoryBot.build(:user)
          @user.first_name = 'ﾀﾛｳ'
          @user.valid?
          expect(@user.errors.full_messages).to include('First name is invalid')
        end
        it '苗字のふりがながないと登録できない' do
          @user = FactoryBot.build(:user)
          @user.last_name = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Last name can't be blank")
        end
        it '名前のふりがながないと登録できない' do
          @user = FactoryBot.build(:user)
          @user.first_name = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("First name can't be blank")
        end
        it '苗字ふりがなは全角カタカナでないと登録できない' do
          @user = FactoryBot.build(:user)
          @user.last_name_kana = '降間'
          @user.valid?
          expect(@user.errors.full_messages).to include('Last name kana is invalid')
        end
        it '名前ふりがなは全角カタカナと登録できない' do
          @user = FactoryBot.build(:user)
          @user.first_name_kana = '太郎'
          @user.valid?
          expect(@user.errors.full_messages).to include('First name kana is invalid')
        end
        it '誕生日がないと登録できない' do
          @user = FactoryBot.build(:user)
          @user.birth_day = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Birth day can't be blank")
        end
      end
    end
  end
end
