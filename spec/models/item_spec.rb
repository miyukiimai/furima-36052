require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
    context '商品が出品できるとき' do
      it 'item_name,item_descrition,category_id,product_condition_id,shipping_cost_id,prefecture_id,delivery_date_id,priceが存在すれば登録できる' do
        expect(@item).to be_valid
      end
    end

    describe '商品出品機能' do
      context '商品が出品できないとき' do
        it 'imageが空だと出品できない' do
          @item.image = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Image can't be blank")
        end

        it 'item_nameが空だと出品できない' do
          @item.item_name = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Item name can't be blank")
        end
        it 'item_descriptionが空だと出品できない' do
          @item.item_description = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Item description can't be blank")
        end
        it 'category_idが空だと出品できない' do
          @item.category_id = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Category can't be blank")
        end
        it 'item_condition_idが空だと出品できない' do
          @item.product_condition_id = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Product condition can't be blank")
        end
        it 'shipping_cost_idが空だと出品できない' do
          @item.shipping_cost_id = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Shipping cost can't be blank")
        end
        it 'prefecture_idが空だと出品できない' do
          @item.prefecture_id = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Prefecture can't be blank")
        end
        it 'delivery_date_idが空だと出品できない' do
          @item.delivery_date_id = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Delivery date can't be blank")
        end
        it 'priceが空だと出品できない' do
          @item.price = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Price can't be blank")
        end
        it 'priceが300円以下だと出品できない' do
          @item.price = 299
          @item.valid?
          expect(@item.errors.full_messages).to include('Price must be greater than or equal to 300')
        end
        it 'priceが9,999,999円以上だと出品できない' do
          @item.price = 10_000_000
          @item.valid?
          expect(@item.errors.full_messages).to include('Price must be less than or equal to 9999999')
        end
        it 'priceは半角数値でないと出品できない' do
          @item.price = '１２３４'
          @item.valid?
          expect(@item.errors.full_messages).to include('Price Half-width number')
        end
        it 'priceが半角英数混合では出品できないこと' do
          @item.price = '300dollars'
          @item.valid?
          expect(@item.errors.full_messages).to include('Price Half-width number')
        end
        it 'priceが半角英語だけでは出品できないこと' do
          @item.price = 'price'
          @item.valid?
          expect(@item.errors.full_messages).to include('Price Half-width number')
        end


          it 'category_idが1だと出品できない' do
            @item.category_id = 1
            @item.valid?
            expect(@item.errors.full_messages).to include("Category can't be blank")
          end
          it 'item_condition_idが1だと出品できない' do
            @item.product_condition_id = 1
            @item.valid?
            expect(@item.errors.full_messages).to include("Product condition can't be blank")
          end
          it 'shipping_cost_idが1だと出品できない' do
            @item.shipping_cost_id = 1
            @item.valid?
            expect(@item.errors.full_messages).to include("Shipping cost can't be blank")
          end
          it 'prefecture_idが1だと出品できない' do
            @item.prefecture_id = 1
            @item.valid?
            expect(@item.errors.full_messages).to include("Prefecture can't be blank")
          end
          it 'delivery_date_idが1だと出品できない' do
            @item.delivery_date_id = 1
            @item.valid?
            expect(@item.errors.full_messages).to include("Delivery date can't be blank")
          end
        end
      end
    end
  end
