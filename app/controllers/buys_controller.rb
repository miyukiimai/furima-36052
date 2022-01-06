class BuysController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :set_tweet, only: [:index, :create ]
  before_action :own_url, only: [:index]

  def index
    @form = Form.new
    @item = Item.find(params[:item_id])
  end

  



  def create
    @form = Form.new(form_params)
    if @form.valid?
      pay_item
      @form.save
      redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def form_params
    params.require(:form).permit(:postal_code, :prefecture_id, :city, :house_number, :building_number, :phone_number)
          .merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  # 自身のPAY.JPテスト秘密鍵を記述しましょう
    Payjp::Charge.create(
      amount: @item.price,
      card: form_params[:token],
      currency: 'jpy'
    )
  end

  def set_tweet
    @item = Item.find(params[:item_id])
  end



  def own_url
    if current_user == @item.user || @item.buy.present?
      redirect_to root_path
    end
  end
end