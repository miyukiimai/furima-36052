class BuysController < ApplicationController
  
  def index
    @form = Form.new
    @item = Item.find(params[:item_id])
  end

  def create
    @buy = Buy.create(buy_params)
    Address.create(address_params)
    redirect_to root_path
  end

  def item_params
    params.require(:item).permit(:item_name, :item_description, :category_id, :product_condition_id, :shipping_cost_id,
                                 :prefecture_id, :delivery_date_id, :price, :image).merge(user_id: current_user.id)
  end
 

  private

  def address_params
    params.require(:form).permit(:postal_code, :prefecture_id, :city, :house_number, :building_number, :phone_number, :buy_id)
  end

  #def address_params
   # params.permit(:postal_code, :prefecture_id, :city, :house_number, :building_number, :phone_number, :buy_id).merge(buy_id: @buy.id)

end