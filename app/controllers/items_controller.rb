class ItemsController < ApplicationController
  before_action :authenticate_user!

  def move_to_root_path
    redirect_to action: :edit unless user_signed_in?
  end


  def index
    @items = Item.all.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

   def edit
    # @item = Item.find(params[:id])
   end

  def show
    @item = Item.find(params[:id])
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(
      :image,
      :name,
      :description,
      :category_id,
      :condition_id,
      :cost_id,
      :prefecture_id,
      :delivery_day_id,
      :price
    ).merge(user_id: current_user.id)
  end

end
