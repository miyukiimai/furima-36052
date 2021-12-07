class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit ]
  before_action :move_to_index, except: [:index, :show, :destroy ]
  before_action :set_tweet, only: [:edit, :show, :update, :destroy]

  def index
    @items = Item.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path(@item)
    else
      render :new
    end
  end

  def show
  end

  def edit
    unless  current_user.id == @item.user_id
      redirect_to action: :index
   end
  end

  def update
   if @item.update(item_params)
    redirect_to item_path
   else
    render :edit
    end
   end


  def destroy
    if @item.destroy
    redirect_to root_path
    end
  end


  private

  def item_params
    params.require(:item).permit(:item_name, :item_description, :category_id, :product_condition_id, :shipping_cost_id,
                                 :prefecture_id, :delivery_date_id, :price, :image).merge(user_id: current_user.id)
  end
  
  def set_tweet
    @item = Item.find(params[:id])
  end


  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end
end
