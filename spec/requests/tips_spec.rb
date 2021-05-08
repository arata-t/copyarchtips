require 'rails_helper'
describe TipsController, type: :request do
  before do
    @user = FactoryBot.create(:user)
    @user[:id] = @user.id + 1
    @tip = FactoryBot.create(:tip)
  end

  describe 'Get#index' do
    it 'action#indexにアクセスすると正常にレスポンスを返す' do
      get root_path
      expect(response.status).to eq 200
    end
    it 'action#indexにリクエストするとレスポンスに投稿したタイトルが表示されている。' do
      get root_path
      expect(response.body).to include @tip.title
    end
    it 'action#indexにリクエストするとレスポンスに投稿したカテゴリーが表示されている' do
      get root_path
      expect(response.body).to include Category.data[@tip.category_id - 1][:name]
    end
    it 'action#indexにリクエストするとレスポンスに投稿した説明が表示されている。' do
      get root_path
      expect(response.body).to include @tip.description
    end
    it 'ログインした状態でaction#indexにアクセスするとレスポンスにマイページが表示される' do
      sign_in @user
      get root_path
      expect(response.body).to include 'マイページ'
    end
    it 'ログインしてない状態でaction#indexにアクセスするとレスポンスにマイページが表示されない' do
      get root_path
      expect(response.body).not_to include 'マイページ'
    end
  end

  describe 'Get#new' do
    it 'ログインした状態でアクセスすると正常にレスポンスを返す' do
      sign_in @user
      get new_tip_path
      expect(response.status).to eq 200
    end
    it 'ログインしていないユーザーがアクセスするとログイン画面にリダイレクトする' do
      get new_tip_path
      expect(response.status).to eq 302
      expect(response).to redirect_to new_user_session_path
    end
  end

  describe 'Get#show' do
    it 'action#showにアクセスすると正常にレスポンスを返す' do
      get tip_path(@tip)
      expect(response.status).to eq 200
    end
    it 'action #showにアクセスしたら投稿したタイトルが表示されている' do
      get tip_path(@tip)
      expect(response.body).to include @tip.title
    end
    it 'action #show にアクセスしたら投稿したらカテゴリーが表示されている' do
      get tip_path(@tip)
      expect(response.body).to include Category.data[@tip.category_id - 1][:name]
    end
    it 'action#showにアクセスしたら投稿したら投稿した説明が表示される' do
      get tip_path(@tip)
      expect(response.body).to include @tip.description
    end
  end

  describe 'Get#edit' do
    it 'action#editにリクエストしたら正常にレスポンスを返す' do
      sign_in @user
      get edit_tip_path(@tip)
      expect(response.status).to eq 200
    end
    it 'action#editにアクセスしたら編集前のタイトルが表示されている' do
      sign_in @user
      get edit_tip_path(@tip)
      expect(response.body).to include @tip.title
    end
    it 'action#editにアクセスしたら編集前のカテゴリーが表示されている' do
      sign_in @user
      get edit_tip_path(@tip)
      expect(response.body).to include Category.data[@tip.category_id - 1][:name]
    end
    it 'action#editにアクセスしたら編集前の説明が表示されている' do
      sign_in @user
      get edit_tip_path(@tip)
      expect(response.body).to include @tip.description
    end
    it '許可されていないユーザーがアクセスするとホーム画面にリダイレクトされる' do
      other_user = FactoryBot.create(:user)
      sign_in other_user
      get edit_tip_path(@tip)
      expect(response.status).to eq 302
      expect(response).to redirect_to root_path
    end
    it 'サインアウトした状態でアクセスするとログイン画面にリダイレクトされる' do
      get edit_tip_path(@tip)
      expect(response.status).to eq 302
      expect(response).to redirect_to new_user_session_path
    end
  end

  describe 'Get#update' do
    it '許可されていないユーザーがupdate_pathにアクセスするとホーム画面にリダイレクトされる' do
      other_user = FactoryBot.create(:user)
      sign_in other_user
      patch tip_path(@tip)
      expect(response.status).to eq 302
      expect(response).to redirect_to root_path
    end
    it 'サインアウトした状態でupdate_pathにアクセスするとログイン画面にリダイレクトする。' do
      patch tip_path(@tip)
      expect(response.status).to eq 302
      expect(response).to redirect_to new_user_session_path
    end
  end

  describe 'Get#destroy' do
    it '許可されていないユーザーがdestroy_pathにアクセスするとホーム画面にリダイレクトされる' do
      other_user = FactoryBot.create(:user)
      sign_in other_user
      delete tip_path(@tip)
      expect(response.status).to eq 302
      expect(response).to redirect_to root_path
    end
    it 'サインアウトした状態でdestroy_pathにアクセスするとログイン画面にリダイレクトする。' do
      delete tip_path(@tip)
      expect(response.status).to eq 302
      expect(response).to redirect_to new_user_session_path
    end
  end
end
