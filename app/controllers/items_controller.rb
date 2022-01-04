class ItemsController < ApplicationController
  def index
  end

  private
  def message_params
    params.require(:item).permit(:image, :name, :price, :description, :condition_id, :category_id, :shipping_area_id, :shipping_fee_id, :shipping_days_id).merge(user_id: current_user.id)
  end
end