class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  def index
    @items = Item.all.order(id: 'DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
    redirect_to action: :index unless @item.user.id == current_user.id
  end

  def update
    @item.update(item_params)
    if @item.valid?
      redirect_to action: :show
    else
      render :edit
    end
  end

  def destroy
    if @item.user.id == current_user.id
    @item.destroy
    redirect_to root_path
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :price, :description, :condition_id, :category_id, :shipping_area_id,
                                 :shipping_fee_id, :shipping_days_id).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
