class BuysController < ApplicationController
  before_action :move_to_index, except: [:index]
  before_action :own_url, only: [:edit, :update, :destroy]
  
  def index
    @form = Form.new
    @item = Item.find(params[:item_id])
    @buy = Buy.new
  end

  def create
    @item = Item.find(params[:item_id])
    #@buy = Buy.new
    #binding.pry



    @form = Form.new(form_params)
    if @form.valid?
     pay_item
     @form.save
      return redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def form_params
    params.require(:form).permit(:postal_code, :prefecture_id, :city, :house_number, :building_number, :phone_number, :buy).
    merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end 

  def pay_item
      Payjp.api_key = "sk_test_6191eea55940b05d63867e09"  # 自身のPAY.JPテスト秘密鍵を記述しましょう
      Payjp::Charge.create(
        amount: @item.price,
        card: form_params[:token],    # カードトークン
        currency: 'jpy'                 # 通貨の種類（日本円）
      )
  end

  def move_to_index

    #item = Item.find(params[:id])
    #unless current_user.id == item.user_id
      #redirect_to root_path
    
  end
  
end






