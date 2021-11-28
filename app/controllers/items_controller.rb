class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new,:edit]

  def index
    @items = Item.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @items = Item.create(item_params)
    if @item.save
      redirect_to root_path(@item)
    else
      render :new
    end
  end

  private
  
  def item_params
    params.require(:item).permit(:item_name, :item_description, :category_id, :product_condition_id, :shipping_cost_id, :prefecture_id, :delivery_date_id, :price, :image).merge(user_id: current_user.id)
  end
end
