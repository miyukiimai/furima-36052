require 'rails_helper'

RSpec.describe Form, type: :model do
  before do
  @form = FactoryBot.build(:form)
end
    
  describe '商品購入機能' do
    context '商品が購入できるとき' do
      it 'postal_code,prefecture_id,city,house_number,phone_numberが存在すれば購入できる' do
        expect(@form).to be_valid
      end
    end

  describe '商品購入機能' do
    context '商品が購入できないとき' do
      it 'postal_codeが空だと購入できない' do
        @form.postal_code = ''
        @form.valid?
        expect(@form.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'postal_codeは半角数字のみ保存可能なこと' do
        @form.postal_code = '１２３４５６７'
        @form.valid?
        expect(@form.errors.full_messages).to include("Postal code Half-width number")
      end
      it 'postal_codeはハイフンを含まないと購入できない' do
        @form.postal_code = '1234567'
        @form.valid?
        expect(@form.errors.full_messages).to include("Postal code invalid. Include hyphen(-)")
      end
      it 'prefecture_idが空だと購入できない' do
        @form.prefecture_id = ''
        @form.valid?
        expect(@form.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'cityが空だと購入できない' do
        @form.city = ''
        @form.valid?
        expect(@form.errors.full_messages).to include("City can't be blank")
      end
      it 'house_numberが空だと購入できない' do
        @form.house_number= ''
        @form.valid?
        expect(@form.errors.full_messages).to include("House number can't be blank")
      end
      it 'phone_numberが空だと購入できない' do
        @form.phone_number = ''
        @form.valid?
        expect(@form.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberはハイフンがあると購入できない' do
        @form.phone_number = '090-1234-5678'
        @form.valid?
        expect(@form.errors.full_messages).to include("Phone number Input only number")  
      end
      it 'phone_numberは半角数値のみ保存可能なこと' do
        @form.phone_number = '０９０１２３４５６７８'
        @form.valid?
        expect(@form.errors.full_messages).to include("Phone number Half-width number")  
      end
      it 'phone_numberは10桁以上で保存可能なこと' do
        @form.phone_number = '12345678'
        @form.valid?
        expect(@form.errors.full_messages).to include("Phone number too short minimum is 10 numbers")  
      end
      it 'phone_numberは11桁以内で保存可能なこと' do
        @form.phone_number = '090123456789'
        @form.valid?
        expect(@form.errors.full_messages).to include("Phone number too long maximum is 11 numbers")
      end
     end
    end
   end
 end
  

