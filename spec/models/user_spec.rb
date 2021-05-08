require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザーの新規登録' do
    context '新規登録がうまくいく時' do
      it 'ニックネーム、メールアドレス、パスワード、姓、名前が存在すれば登録できる' do
        expect(@user).to be_valid
      end
      it '自己紹介は空でも登録できる' do
        @user.introduction = ''
        expect(@user).to be_valid
      end
    end

    context '新規登録がうまく行かない時' do
      it '- ニックネームが空だと登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Nickname can't be blank"
      end
      it '- メールアドレスが空だと登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Email can't be blank"
      end
      it '- メールアドレスが一意性でないと登録できない' do
        @user.save!
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include 'Email has already been taken'
      end
      it '- メールアドレスは、@を含まないと登録できない' do
        @user.email = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Email is invalid'
      end
      it '- メールアドレスは、全角だと登録できない' do
        @user.email = 'あああ＠嗚呼嗚呼'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Email is invalid'
      end
      it '- パスワードが空だと登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Password can't be blank"
      end
      it '- パスワードは、５文字以下だと登録できない' do
        @user.password = 'aaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Password is too short (minimum is 6 characters)'
      end
      it '- パスワードは、全角だと登録できない' do
        @user.password = 'ああああああ'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Password は半角英数６文字以上としてください'
      end
      it '- パスワード（確認用は）は、空だと登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
      end
      it '- パスワード（確認用は）はパスワードと一致していないと登録できない' do
        @user.password_confirmation = 'aaaaaa'
        @user.password = 'bbbbbb'
        @user.valid?
        expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
      end
      it '- 姓が空だと登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name can't be blank"
      end
      it '- 姓は小文字だと登録できない' do
        @user.last_name = 'aaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Last name には全角文字を使用してください'
      end
      it '- 姓は大文字英数だと登録できない' do
        @user.last_name = 'AAAAAA'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Last name には全角文字を使用してください'
      end
      it '- 名前が空だと登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "First name can't be blank"
      end
      it '- 名前は小文字だと登録できない' do
        @user.first_name = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include 'First name には全角文字を使用してください'
      end
      it '- 名前は大文字英数だと登録できない' do
        @user.first_name = 'AAAAAA'
        @user.valid?
        expect(@user.errors.full_messages).to include 'First name には全角文字を使用してください'
      end
    end
  end
end
