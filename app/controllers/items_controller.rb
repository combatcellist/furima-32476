class ItemsController < ApplicationController
  before_action :authenticate_user!

  def move_to_root_path
    redirect_to action: :edit unless user_signed_in?
  end


  def index
    @items = Item.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def edit
  end

  def show
  end

  def create
    @item = Item.new(params[:id])
    if @item.save
      redirect_to root_top
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(
      :name, 
      :condition,
      :category,
      :cost,
      :derivery_day,
      :prefecture
    )
  end

end
