class ItemsController < ApplicationController

  before_action :authenticate_user!, only: [:index, :show, :update]
  # before_action :baria_user, only: [:edit, :update]

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

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to item_path(@item.id)
    else
      render :edit
    end
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

  # def baria_user
    # unless Item.find(params[:id]).user.id.to_i == current_user.id
        # redirect_to root_path
    # end
  # end

end
