require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end  
  
  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it 'nickname、email、password、password_confirmation、lastname_kanji、firstname_kanji、lastname_kana、firstname_kana、birth_dateが存在すれば登録できる' do
        expect(@user).to be_valid
      end
    end
    context '新規登録できないとき' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it '重複したemailが存在する場合は登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'emailは@を含まないと登録できない' do
        @user.email = 'testmail'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordが5文字以下では登録できない' do
        @user.password = '00000'
        @user.password_confirmation = '00000'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'passwordが129文字以上では登録できない' do
        @user.password = Faker::Internet.password(min_length: 129, max_length: 150)
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too long (maximum is 128 characters)')
      end
      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password = '000000'
        @user.password_confirmation = '000001'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'passwordは半角英字だけでは登録できない' do
        @user.password = 'abcdef'
        @user.password_confirmation = 'abcdef'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end
      it 'passwordは半角数字だけでは登録できない' do
        @user.password = '123456'
        @user.password_confirmation = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end
      it 'passwordは全角では登録できない' do
        @user.password = 'ああああああ'
        @user.password_confirmation = 'ああああああ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end
        it 'lastname_kanjiが空では登録できない' do
        @user.lastname_kanji = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Lastname kanji can't be blank")
      end
      it 'firstname_kanjiが空では登録できない' do
        @user.firstname_kanji = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Firstname kanji can't be blank")
      end
      it 'lastnmae_kanjiに半角文字が含まれていると登録できない' do
        @user.lastname_kanji = 'yamada'
        @user.valid?
        expect(@user.errors.full_messages).to include('Lastname kanji is invalid')
      end
      it 'firstname_kanjiに半角文字が含まれていると登録できない' do
        @user.firstname_kanji = 'tarou'
        @user.valid?
        expect(@user.errors.full_messages).to include('Firstname kanji is invalid')
      end
      it 'lastname_kanaが空では登録できない' do
        @user.lastname_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Lastname kana can't be blank")
      end
      it 'firstname_kanaが空では登録できない' do
        @user.firstname_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Firstname kana can't be blank")
      end
      it 'lastname_kanaにカタカナ以外(ひらがな・漢字・英数字など)が含まれていると登録できない' do
        @user.lastname_kana = '山田'
        @user.valid?
        expect(@user.errors.full_messages).to include('Lastname kana is invalid')
      end
      it 'firstname_kanaにカタカナ以外(ひらがな・漢字・英数字など)が含まれていると登録できない' do
        @user.firstname_kana = '太郎'
        @user.valid?
        expect(@user.errors.full_messages).to include('Firstname kana is invalid')
      end
      it 'birth_dateが空では登録できない' do
        @user.birth_date = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birth date can't be blank")
      end
    end
  end
end
