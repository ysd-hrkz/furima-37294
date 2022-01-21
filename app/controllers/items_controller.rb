class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  def index
    @items = Item.all.order(id: 'DESC')
  end

  def new
    @item_form = ItemForm.new
  end

  def create
    @item_form = ItemForm.new(item_form_params)
    if @item_form.valid?
      @item_form.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
    item_attributes = @item.attributes
    @item_form = ItemForm.new(item_attributes)
    redirect_to action: :index unless @item.user.id == current_user.id && @item.order.nil?

    @item_form.tag_name = @item.tags&.first&.tag_name
  end

  def update
    @item_form =ItemForm.new(item_form_params)

    @item_form.image ||= @item.image.blob
    
    if @item_form.valid?
      @item_form.update(item_form_params, @item)
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

  def search
    return nil if params[:keyword] == ""
    tag = Tag.where(['tag_name LIKE ?', "%#{params[:keyword]}%"])
    render json:{ keyword: tag }
  end
  
  private

  def item_form_params
    params.require(:item_form).permit(:image, :name, :price, :description, :condition_id, :category_id, :shipping_area_id,
                                 :shipping_fee_id, :shipping_days_id, :tag_name).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
