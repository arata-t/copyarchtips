require 'rails_helper'

RSpec.describe Tip, type: :model do
  before do
    @tip = FactoryBot.build(:tip)
  end

  describe '投稿する' do
    context '投稿できる' do
      it 'タイトル、カテゴリー、説明を入力すると投稿できる' do
        expect(@tip).to be_valid
      end

      it '画像が空でも投稿できる' do
        @tip.image = ''
        expect(@tip).to be_valid
      end
    end

    context '投稿できない' do
      it 'タイトルが空だと投稿できない' do
        @tip.title = ''
        @tip.valid?
        expect(@tip.errors.full_messages).to include "Title can't be blank"
      end

      it 'カテゴリーが空だと投稿できない' do
        @tip.category_id = ''
        @tip.valid?
        expect(@tip.errors.full_messages).to include 'Category is not a number'
      end

      it 'カテゴリーが1だと投稿できない' do
        @tip.category_id = '1'
        @tip.valid?
        expect(@tip.errors.full_messages).to include 'Category must be other than 1'
      end

      it '説明が空だと投稿できない' do
        @tip.description = ''
        @tip.valid?
        expect(@tip.errors.full_messages).to include "Description can't be blank"
      end
    end
  end
end
