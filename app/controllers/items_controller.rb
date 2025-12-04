class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new]
  def index

  end

  def new
   @item = Item.new
  end

  def create
  end

  private
  def item_params
    params.require(:item).permit(:name, :content, :price, :category_id, :condition_id, :shipping_fee_payer_id, :prefecture_id, :schedule_delivery_id, :image).merge(user_id: current_user.id)
  end
end
