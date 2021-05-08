require 'rails_helper'

RSpec.describe 'Comments', type: :request do
  before do
    @user = FactoryBot.create(:user)
    @tip = FactoryBot.create(:tip)
  end
  describe 'GET/tips/show' do
    it 'ログインした状態でtips/showにアクセスするとコメントが投稿覧が表示される' do
      sign_in @user
      get tip_path(@tip)
      expect(response.body).to include 'コメントする'
    end
    it 'ログインしていない状態でtips/showにアクセスするとコメント欄が表示されない' do
      get tip_path(@tip)
      expect(response.body).not_to include 'コメントする'
    end
  end
end
