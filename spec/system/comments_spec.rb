require 'rails_helper'

RSpec.describe 'Comments', type: :system do
  before do
    @tip = FactoryBot.create(:tip)
    @comment = FactoryBot.create(:comment)
  end

  it 'コメントが投稿できること' do
    # ログイン
    sign_in(@tip.user)
    # 詳細
    click_on @tip.title
    # コメント
    comment(@comment)
  end
  it 'コメントが投稿できたらマイページのコメント数が変更していること' do
    # ログイン
    sign_in(@tip.user)
    # 詳細
    click_on @tip.title
    # コメント
    comment(@comment)
    # マイページ
    visit user_path(@tip.user.id)
    expect(page).to have_content(@tip.user.comments.length)
  end
end
