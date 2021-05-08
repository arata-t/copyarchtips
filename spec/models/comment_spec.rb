require 'rails_helper'

RSpec.describe Comment, type: :model do
  before do
    @comment = FactoryBot.build(:comment)
  end

  describe 'コメントする' do
    context 'コメントできる' do
      it 'コメントを入力するとコメントできる' do
        expect(@comment).to be_valid
      end
    end
    context 'コメントに失敗する' do
      it 'コメントが空なので投稿に失敗する' do
        @comment.comment = ''
        @comment.valid?
        expect(@comment.errors.full_messages).to include "Comment can't be blank"
      end
    end
  end
end
