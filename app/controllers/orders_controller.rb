class OrdersController < ApplicationController
  def index
    @order = Order.new
  end

  def create
    @order_shipping = OrderShipping.new(order_params)
    if @order_shipping.valid?
      @order_shipping.save
      return redirect_to root_path
    else
      render :index
    end
  end

  private
  def order_params
    params.require(:order_shipping).permit(:post_code, :shipping_area_id, :city, :address, :building_name, :phone_num).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end
