require 'rails_helper'

RSpec.describe 'Users', type: :request do
  before do
    @user = FactoryBot.create(:user)
    @tip = FactoryBot.create(:tip)
  end

  describe 'GET /users' do
    # ログイン
    it 'users/sign_inにリクエストすると正常にレスポンスが返ってくる' do
      get new_user_session_path
      expect(response.status).to eq 200
    end
    # 新規登録
    it 'users/sign_upにリクエストすると正常にレスポンスが返ってくる' do
      get new_user_registration_path
      expect(response.status).to eq 200
    end
    # マイページ
    it 'マイページにアクセスると正常にレスポンスを返す' do
      get user_path(@user.id)
      expect(response.status).to eq 200
    end
    it 'マイページにアクセスするとマイページのニックネームが表示される' do
      get user_path(@user.id)
      expect(response.body).to include @user.nickname
    end
    it 'マイページにアクセスするとマイページの自己紹介が表示される' do
      get user_path(@user.id)
      expect(response.body).to include @user.introduction
    end
    it 'マイページにアクセスすると投稿数が表示される' do
      get user_path(@user.id)
      expect(response.body).to include @user.tips.length.to_s
    end
  end
end
