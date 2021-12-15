require 'rails_helper'

RSpec.describe Address, type: :model do
  before do
  @address = FactoryBot.build(:address)
end

describe '商品購入機能' do
  context '商品が購入できるとき' do
    it 'card_number,month,year,code,postal_code,prefecture_id,city,house_number,phone_numberが存在すれば登録できる' do
      expect(@address).to be_valid
    end
  end

  describe '商品購入機能' do
    context '商品が購入できないとき' do
      it 'postal_codeが空だと購入できない' do
        @address.potal_code = ''
        @address.valid?
        expect(@address.errors.full_messages).to include("Postal code can't be blank")
      end

      it 'postal_codeは、「3桁ハイフン4桁」の半角文字列のみ保存可能なこと' do
        @address.postal_code = 1234567
        @address.valid?
        expect(@address.errors.full_messages).to include("Postal code Input correctly")
      end
      it 'prefecture_idが空だと購入できない' do
        @address.prefecture_id = ''
        @address.valid?
        expect(@address.errors.full_messages).to include("Prefecture Select"))
      end
      it 'cityが空だと購入できない' do
        @address.city = ''
        @address.valid?
        expect(@address.errors.full_messages).to include("City can't be blank")
      end
      it 'house_numberが空だと購入できない' do
        @address.house_number= ''
        @address.valid?
        expect(@address.errors.full_messages).to include("House number can't be blank")
      end
      it 'phone_numberが空だと購入できない' do
        @address.phone_number = ''
        @address.valid?
        expect(@address.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberは、ハイフンがあると購入できない' do
        @address.phone_number = 090-1234-5678
        @address.valid?
        expect(@address.errors.full_messages).to include("Phone number Input only number")  
      end
      it 'phone_numberは、半角数値のみ保存可能なこと' do
        @address.phone_number = ０９０１２３４５６７８
        @address.valid?
        expect(@address.errors.full_messages).to include("Phone number Half-width number")  
      end
      it 'phone_numberは、10桁以上で保存可能なこと' do
        @address.phone_number = 09012345678
        @address.valid?
        expect(@address.errors.full_messages).to include("Phone number too short (minimum is 10 characters")  
      end
      it 'phone_numberは、11桁以内で保存可能なこと' do
        @address.phone_number = 090123456789
        @address.valid?
        expect(@address.errors.full_messages).to include("Phone number too long (maximum is 11 characters")  
      end
    end
  end
  