require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '#create' do
    context 'アイテムが保存できる場合' do
      it 'すべての項目が存在すれば保存できること' do
        expect(@item).to be_valid
      end
      it 'メモは空でも保存できること' do
        @item.memo = ''
        expect(@item).to be_valid
      end
    end
    context 'アイテムが保存できない場合' do
      it '名前が空では保存できない' do
        @item.name = ''
        binding.pry
        expect(@item.errors.full_messages).to include()
      end     
      it '数量が空では保存できない' do
        @item.quantity = ''
        @item.valid?
        expect(@item.errors.full_messages).to include()
      end
      it '数量が0以上では保存できない' do
        @item.quantity = ''
        @item.valid?
        expect(@item.errors.full_messages).to include()
      end
      it '数量が101では保存できない' do
        @item.quantity = ''
        @item.valid?
        expect(@item.errors.full_messages).to include()
      end
      it '購入日が空では保存できない' do
        @item.purchase_date = ''
        @item.valid?
        expect(@item.errors.full_messages).to include()
      end     
      it '賞味期限が空では保存できない' do
        @item.expiration_date = ''
        @item.valid?
        expect(@item.errors.full_messages).to include()
      end     
      it '画像が空では保存できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include()
      end     
      it 'ユーザーが紐付いていなければ投稿できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include()
      end
    end
  end
end
