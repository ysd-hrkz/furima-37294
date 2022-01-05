class ItemsController < ApplicationController
  before_action :authenticate_user!, only: :new

  def index
  end

  def new
    @item = Item.new
  end



  private
  def item_params
    params.require(:item).permit(:image, :name, :price, :description, :condition_id, :category_id, :shipping_area_id, :shipping_fee_id, :shipping_days_id).merge(user_id: current_user.id)
  end
end