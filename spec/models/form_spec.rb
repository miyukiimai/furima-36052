require 'rails_helper'

RSpec.describe Form, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item)
    @form = FactoryBot.build(:form, user_id: @user.id, item_id: @item.id)

    sleep 0.5
  end

  describe '商品購入機能' do
    context '商品が購入できるとき' do
      it 'postal_code,prefecture_id,city,house_number,phone_number,token,item_id,user_idが存在すれば購入できる' do
        expect(@form).to be_valid
      end
      it 'building_numberが存在しなくても購入できる' do
        @form.building_number = ''
        expect(@form).to be_valid
      end
    end

    describe '商品購入機能' do
      context '商品が購入できないとき' do
        it 'tokenが空では登録できないこと' do
          @form.token = nil
          @form.valid?
          expect(@form.errors.full_messages).to include("Token can't be blank")
        end
        it 'postal_codeが空だと購入できない' do
          @form.postal_code = ''
          @form.valid?
          expect(@form.errors.full_messages).to include("Postal code can't be blank")
        end
        it 'postal_codeは半角数字のみ保存可能なこと' do
          @form.postal_code = '１２３４５６７'
          @form.valid?
          expect(@form.errors.full_messages).to include("Postal code Input correctly")
        end
        it 'postal_codeはハイフンを含まないと購入できない' do
          @form.postal_code = '1234567'
          @form.valid?
          expect(@form.errors.full_messages).to include("Postal code Input correctly")
        end
        it 'prefecture_idが空だと購入できない' do
          @form.prefecture_id = 1
          @form.valid?
          expect(@form.errors.full_messages).to include("Prefecture can't be blank")
        end
        it 'cityが空だと購入できない' do
          @form.city = ''
          @form.valid?
          expect(@form.errors.full_messages).to include("City can't be blank")
        end
        it 'house_numberが空だと購入できない' do
          @form.house_number = ''
          @form.valid?
          expect(@form.errors.full_messages).to include("House number can't be blank")
        end
        it 'phone_numberが空だと購入できない' do
          @form.phone_number = ''
          @form.valid?
          expect(@form.errors.full_messages).to include("Phone number Input correctly")
        end
        it 'phone_numberはハイフンがあると購入できない' do
          @form.phone_number = '090-1234-5678'
          @form.valid?
          expect(@form.errors.full_messages).to include("Phone number Input correctly")
        end
        it 'phone_numberは半角数値のみ保存可能なこと' do
          @form.phone_number = '０９０１２３４５６７８'
          @form.valid?
          expect(@form.errors.full_messages).to include("Phone number Input correctly")
        end
        it 'phone_numberは10桁以上で保存可能なこと' do
          @form.phone_number = '12345678'
          @form.valid?
          expect(@form.errors.full_messages).to include("Phone number Input correctly")
        end
        it 'phone_numberは11桁以内で保存可能なこと' do
          @form.phone_number = '090123456789'
          @form.valid?
          expect(@form.errors.full_messages).to include("Phone number Input correctly")
        end
        it 'user_idが空だと購入できない' do
          @form.user_id = ''
          @form.valid?
          expect(@form.errors.full_messages).to include("User can't be blank")
        end
        it 'item_idが空だと購入できない' do
          @form.item_id = ''
          @form.valid?
          expect(@form.errors.full_messages).to include("Item can't be blank")
        end
      end
    end
  end
end
